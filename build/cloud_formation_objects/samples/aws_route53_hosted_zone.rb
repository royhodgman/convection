require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Route53::HostedZone
        ##
        class Route53HostedZone < Resource


          property :hosted_zone_config, 'HostedZoneConfig'
          property :name, 'Name'

          def initialize(*args)
            super
            type 'AWS::Route53::HostedZone'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_route53_hosted_zone(name, &block)
        r = Model::Template::Resource::Route53HostedZone.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end