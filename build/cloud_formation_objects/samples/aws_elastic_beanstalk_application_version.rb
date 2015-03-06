require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElasticBeanstalk::ApplicationVersion
        ##
        class ElasticBeanstalkApplicationVersion < Resource


          property :application_name, 'ApplicationName'
          property :description, 'Description'
          property :source_bundle, 'SourceBundle'

          def initialize(*args)
            super
            type 'AWS::ElasticBeanstalk::ApplicationVersion'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_elastic_beanstalk_application_version(name, &block)
        r = Model::Template::Resource::ElasticBeanstalkApplicationVersion.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end