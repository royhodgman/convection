require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::AutoScaling::AutoScalingGroup
        ##
        class AutoScalingAutoScalingGroup < Resource

          include Model::Mixin::Taggable

          property :cooldown, 'Cooldown'
          property :desired_capacity, 'DesiredCapacity'
          property :health_check_grace_period, 'HealthCheckGracePeriod'
          property :health_check_type, 'HealthCheckType'
          property :instance_id, 'InstanceId'
          property :launch_configuration_name, 'LaunchConfigurationName'
          property :max_size, 'MaxSize'
          property :min_size, 'MinSize'
          property :notification_configuration, 'NotificationConfiguration'
          property :placement_group, 'PlacementGroup'

          def initialize(*args)
            super
            type 'AWS::AutoScaling::AutoScalingGroup'

            @properties['AvailabilityZones'] = []
            @properties['LoadBalancerNames'] = []
            @properties['MetricsCollection'] = []
            @properties['Tags'] = []
            @properties['TerminationPolicies'] = []
            @properties['VPCZoneIdentifier'] = []
          end

          def availability_zones(value)
            @properties['AvailabilityZones'] << value
          end
                    def load_balancer_names(value)
            @properties['LoadBalancerNames'] << value
          end
                    def metrics_collection(value)
            @properties['MetricsCollection'] << value
          end
                    def tags(value)
            @properties['Tags'] << value
          end
                    def termination_policies(value)
            @properties['TerminationPolicies'] << value
          end
                    def vpc_zone_identifier(value)
            @properties['VPCZoneIdentifier'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_auto_scaling_auto_scaling_group(name, &block)
        r = Model::Template::Resource::AutoScalingAutoScalingGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end