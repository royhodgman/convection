# -*- coding: utf-8 -*-
import codecs
import demjson
import inflection
import json
import pystache
import re
import scrapy
import urlparse
from scrapy.utils.response import get_base_url
from scrapy.utils.markup import remove_tags
from scrapy.selector import Selector

class AmazonSpider(scrapy.Spider):
    name = "amazon"
    allowed_domains = ["amazon.com"]
    start_urls = (
        'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html',
        #'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-product-property-reference.html',
        #'http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html',
    )

        
    def parse(self, response):

        base_url = get_base_url( response )

        urls = response.xpath("//div[@class='highlights']/ul/li/a/@href").extract()
        if( urls != None
            and len(urls) > 0 ):
            
            for url in urls:
                full_url = urlparse.urljoin(base_url,url)
                yield scrapy.Request( full_url, callback=self.parse)

        else:

            # TODO: this should be moved out to the class level
            with codecs.open( "cloud_formation_objects/spiders/ruby-class.mustache", "r", "utf-8" ) as template_file:
                template_source = template_file.read()
                template_parsed = pystache.parse( template_source )
                renderer = pystache.Renderer()
            
            resource_data = {}
            resource_type = response.xpath("//h1[@class='topictitle']/text()").extract()
            resource_data[ "type" ] = resource_type[0]
            resource_data[ "type_underscore" ] = inflection.underscore(resource_type[0]).replace( "::", "_" ).lower()
            resource_data[ "ruby_class_name" ] = "".join( resource_type[0].split( "::" )[1:])
            resource_data[ "properties" ] = []
            resource_data[ "list_properties" ] = []
            resource_data[ "mixins" ] = set()

            variable_lists = response.xpath("//div[@class='variablelist']").extract()

            if( len( variable_lists ) > 0 ):

                property_names = Selector(text=variable_lists[0]).xpath("/html/body/div/dl/dt/span/text()").extract()
                property_descriptions = Selector(text=variable_lists[0]).xpath("/html/body/div/dl/dd").extract()
                
                if( len( property_names ) == len( property_descriptions ) ):
                    for i in range( len( property_names ) ):
                        property_data = {}
                        property_data[ "name" ] = property_names[ i ]
                        property_data[ "name_underscore" ] = inflection.underscore( property_names[ i ] )
        
                        paragraphs = Selector(text=property_descriptions[i]).xpath("//p").extract()
                        for paragraph in paragraphs:
                            clean_paragraph = remove_tags( paragraph )
    
                            if( clean_paragraph.startswith( "Type:" ) ):
                                property_type = clean_paragraph.replace( "Type:", "", 1 ).strip()
                                property_data[ "type" ] =  property_type
                            elif( clean_paragraph.startswith( "Type" ) ):
                                property_type = clean_paragraph.replace( "Type", "", 1 ).strip()
                                property_data[ "type" ] =  property_type
                            elif( clean_paragraph.startswith( "Required:" ) ):
                                property_type = clean_paragraph.replace( "Required:", "", 1 ).strip()
                                property_data[ "required" ] =  property_type
                            elif( clean_paragraph.startswith( "Required" ) ):
                                property_type = clean_paragraph.replace( "Required", "", 1 ).strip()
                                property_data[ "required" ] =  property_type

                        # is it tags?
                        if( property_data[ "name" ] == "Tags" ):
                            resource_data[ "mixins" ].add( "Taggable" )
                                
                        # is it a list?
                        lower_type = property_data[ "type" ].lower()
                        if( lower_type.startswith( "list of " ) or
                            lower_type.startswith( "a list of " ) or
                            lower_type.endswith( " list" ) ):

                            resource_data[ "list_properties" ].append( property_data )
                        else:
                            resource_data[ "properties" ].append( property_data )

                # clean up the list of mixins
                resource_data[ "mixins" ] = list( resource_data[ "mixins" ] )
                        
                filename = response.url.split("/")[-1]
                resource_filename = "samples/{}.data".format( filename )
                with open(resource_filename, 'wb') as f_out:
                    json.dump( resource_data, f_out )

                ruby_class_filename = "samples/{}.rb".format( resource_data[ "type_underscore" ] )
                with open( ruby_class_filename, 'wb' ) as ruby_out:
                    ruby_out.write( renderer.render( template_parsed, resource_data ) )
            
    def parse2(self, response):

        base_url = get_base_url( response )

        urls = response.xpath("//div[@class='highlights']/ul/li/a/@href").extract()
        for url in urls:
            full_url = urlparse.urljoin(base_url,url)
            yield scrapy.Request( full_url, callback=self.parse)
        
        program_listings = response.xpath("//pre[@class='programlisting']").extract()
        if( program_listings != None and
            len( program_listings ) > 0 ):            
            
            raw_text = remove_tags( program_listings[ 0 ] ).strip()

            if( not raw_text.startswith( "AWS::" ) ):
                filename = response.url.split("/")[-1]

                raw_filename = "samples/{}.raw".format( filename )
                clean_filename = "samples/{}.clean".format( filename )
                
                clean_text = self.clean_text( raw_text )
                is_clean = True
                try:
                    data = json.loads( clean_text )
                except ValueError:
                    is_clean = False
                    clean_filename = "samples/{}.clean.parse_error".format( filename )

                with open(raw_filename, 'wb') as f:
                    f.write(raw_text.encode('utf-8'))

                with open(clean_filename, 'wb') as f:
                    f.write(clean_text.encode('utf-8'))
                    
    def clean_text(self, raw_text):

        # make sure there are commas at the end of each line
        raw_text = raw_text.replace( '\n', ',\n' )
        raw_text = raw_text.replace( '{,', '{' )
        raw_text = raw_text.replace( '},', '}' )
        raw_text = raw_text.replace( ',,', ',' )

        # remove any array indicators
        raw_text = raw_text.replace( ', ...,', '' )
        raw_text = raw_text.replace( ', ...', '' )
        
        # put a " on the right side of a :
        raw_text = raw_text.replace( ' : ', ' : "' )

        # clean up when that puts a " before a { or a [
        raw_text = raw_text.replace( '"{', '{' )
        raw_text = raw_text.replace( '"[', '[' )
        
        # add " to the end of each line
        raw_text = raw_text.replace( ',\n', '",\n' )

        # remove spaces and new lines
        raw_text = raw_text.replace( " ", "" )

        # put things between braces in quotes
        # square_quotes = re.compile( '\[([^}]*)?\]', re.VERBOSE )
        # raw_text = square_quotes.sub( '["\1"]', raw_text )

        raw_text = raw_text.replace( '[', '["' )
        raw_text = raw_text.replace( ']', '"]' )

        raw_text = raw_text.replace( '{', '{"' )
        raw_text = raw_text.replace( '}', '"}' )

        # clean up various things that could have been added above
        raw_text = raw_text.replace( "\n", "" )
        raw_text = raw_text.replace( '""', '"' )
        raw_text = raw_text.replace( ",}", "}" )
        raw_text = raw_text.replace( ']"', ']' )

        raw_text = raw_text.replace( '}"', '}' )
        raw_text = raw_text.replace( '"{', '{' )

        raw_text = raw_text.replace( ':{', ':{"type":' )
        raw_text = raw_text.replace( '"Properties":{"type":', '"Properties":{' )

        # just random errors
        raw_text = raw_text.replace( ',"}', '}' )        
        raw_text = raw_text.replace( ',",', ',' )        

        return raw_text

    def clean_text_old(self, raw_text):

        # make sure there are commas at the end of each line
        raw_text = raw_text.replace( '\n', ',\n' )
        raw_text = raw_text.replace( '{,', '{' )
        raw_text = raw_text.replace( '},', '}' )
        raw_text = raw_text.replace( ',,', ',' )

        # replace any array indicators with a "
        raw_text = raw_text.replace( ', ...', '"' )
        
        # put a " on the right side of a :
        raw_text = raw_text.replace( ' : ', ' : "' )

        # clean up when that puts a " before a { or a [
        raw_text = raw_text.replace( '"{', '{' )
        raw_text = raw_text.replace( '"[ ', '[ "' )
        
        # add " to the end of each line
        raw_text = raw_text.replace( ',\n', '",\n' )
        
        # raw_text = raw_text.replace( '\n', '"\n' )
        # raw_text = raw_text.replace( '{"', '{' )
        # raw_text = raw_text.replace( '}"', '}' )
        
        # # replace double quotes with one    
        # raw_text = raw_text.replace( ']",', '],' )
        
        # raw_text = raw_text.replace( ']\n', '],\n' )
        
        raw_text = raw_text.replace( ', ]', ' ]' )

        # remove spaces and new lines
        raw_text = raw_text.replace( " ", "" )
        raw_text = raw_text.replace( "\n", "" )

        # clean up various things that could have been added above
        raw_text = raw_text.replace( '""', '"' )
        raw_text = raw_text.replace( ",}", "}" )
        raw_text = raw_text.replace( ']"', ']' )

        return raw_text
