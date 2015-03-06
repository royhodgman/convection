require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElasticBeanstalk::ConfigurationTemplate
        ##
        class ElasticBeanstalkConfigurationTemplate < Resource


          property :application_name, 'ApplicationName'
          property :description, 'Description'
          property :environment_id, 'EnvironmentId'
          property :solution_stack_name, 'SolutionStackName'
          property :source_configuration, 'SourceConfiguration'

          def initialize(*args)
            super
            type 'AWS::ElasticBeanstalk::ConfigurationTemplate'

            @properties['OptionSettings'] = []
          end

          def option_settings(value)
            @properties['OptionSettings'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_elastic_beanstalk_configuration_template(name, &block)
        r = Model::Template::Resource::ElasticBeanstalkConfigurationTemplate.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end