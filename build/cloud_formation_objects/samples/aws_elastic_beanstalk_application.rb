require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElasticBeanstalk::Application
        ##
        class ElasticBeanstalkApplication < Resource


          property :application_name, 'ApplicationName'
          property :description, 'Description'

          def initialize(*args)
            super
            type 'AWS::ElasticBeanstalk::Application'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_elastic_beanstalk_application(name, &block)
        r = Model::Template::Resource::ElasticBeanstalkApplication.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end