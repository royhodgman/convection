require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElasticLoadBalancing::LoadBalancer
        ##
        class ElasticLoadBalancingLoadBalancer < Resource

          include Model::Mixin::Taggable

          property :access_logging_policy, 'AccessLoggingPolicy'
          property :connection_draining_policy, 'ConnectionDrainingPolicy'
          property :connection_settings, 'ConnectionSettings'
          property :cross_zone, 'CrossZone'
          property :health_check, 'HealthCheck'
          property :load_balancer_name, 'LoadBalancerName'
          property :scheme, 'Scheme'
          property :tags, 'Tags'

          def initialize(*args)
            super
            type 'AWS::ElasticLoadBalancing::LoadBalancer'

            @properties['AppCookieStickinessPolicy'] = []
            @properties['AvailabilityZones'] = []
            @properties['Instances'] = []
            @properties['LBCookieStickinessPolicy'] = []
            @properties['Listeners'] = []
            @properties['Policies'] = []
            @properties['SecurityGroups'] = []
            @properties['Subnets'] = []
          end

          def app_cookie_stickiness_policy(value)
            @properties['AppCookieStickinessPolicy'] << value
          end
                    def availability_zones(value)
            @properties['AvailabilityZones'] << value
          end
                    def instances(value)
            @properties['Instances'] << value
          end
                    def lb_cookie_stickiness_policy(value)
            @properties['LBCookieStickinessPolicy'] << value
          end
                    def listeners(value)
            @properties['Listeners'] << value
          end
                    def policies(value)
            @properties['Policies'] << value
          end
                    def security_groups(value)
            @properties['SecurityGroups'] << value
          end
                    def subnets(value)
            @properties['Subnets'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_elastic_load_balancing_load_balancer(name, &block)
        r = Model::Template::Resource::ElasticLoadBalancingLoadBalancer.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end