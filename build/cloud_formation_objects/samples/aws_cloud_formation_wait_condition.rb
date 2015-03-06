require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudFormation::WaitCondition
        ##
        class CloudFormationWaitCondition < Resource


          property :count, 'Count'
          property :handle, 'Handle'
          property :timeout, 'Timeout'

          def initialize(*args)
            super
            type 'AWS::CloudFormation::WaitCondition'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_formation_wait_condition(name, &block)
        r = Model::Template::Resource::CloudFormationWaitCondition.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end