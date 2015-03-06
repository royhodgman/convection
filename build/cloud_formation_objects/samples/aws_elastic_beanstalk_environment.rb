require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElasticBeanstalk::Environment
        ##
        class ElasticBeanstalkEnvironment < Resource


          property :application_name, 'ApplicationName'
          property :cname_prefix, 'CNAMEPrefix'
          property :description, 'Description'
          property :environment_name, 'EnvironmentName'
          property :solution_stack_name, 'SolutionStackName'
          property :template_name, 'TemplateName'
          property :tier, 'Tier'
          property :version_label, 'VersionLabel'

          def initialize(*args)
            super
            type 'AWS::ElasticBeanstalk::Environment'

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
      def aws_elastic_beanstalk_environment(name, &block)
        r = Model::Template::Resource::ElasticBeanstalkEnvironment.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end