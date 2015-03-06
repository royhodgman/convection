require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::CustomerGateway
        ##
        class EC2CustomerGateway < Resource

          include Model::Mixin::Taggable

          property :bgp_asn, 'BgpAsn'
          property :ip_address, 'IpAddress'
          property :tags, 'Tags'
          property :type, 'Type'

          def initialize(*args)
            super
            type 'AWS::EC2::CustomerGateway'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_customer_gateway(name, &block)
        r = Model::Template::Resource::EC2CustomerGateway.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end