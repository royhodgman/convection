require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::AutoScaling::ScalingPolicy
        ##
        class AutoScalingScalingPolicy < Resource


          property :adjustment_type, 'AdjustmentType'
          property :auto_scaling_group_name, 'AutoScalingGroupName'
          property :cooldown, 'Cooldown'
          property :scaling_adjustment, 'ScalingAdjustment'

          def initialize(*args)
            super
            type 'AWS::AutoScaling::ScalingPolicy'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_auto_scaling_scaling_policy(name, &block)
        r = Model::Template::Resource::AutoScalingScalingPolicy.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end