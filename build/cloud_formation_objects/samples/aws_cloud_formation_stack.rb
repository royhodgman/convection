require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudFormation::Stack
        ##
        class CloudFormationStack < Resource


          property :parameters, 'Parameters'
          property :template_url, 'TemplateURL'
          property :timeout_in_minutes, 'TimeoutInMinutes'

          def initialize(*args)
            super
            type 'AWS::CloudFormation::Stack'

            @properties['NotificationARNs'] = []
          end

          def notification_ar_ns(value)
            @properties['NotificationARNs'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_formation_stack(name, &block)
        r = Model::Template::Resource::CloudFormationStack.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end