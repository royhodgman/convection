require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::VPNConnectionRoute
        ##
        class EC2VPNConnectionRoute < Resource


          property :destination_cidr_block, 'DestinationCidrBlock'
          property :vpn_connection_id, 'VpnConnectionId'

          def initialize(*args)
            super
            type 'AWS::EC2::VPNConnectionRoute'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_vpn_connection_route(name, &block)
        r = Model::Template::Resource::EC2VPNConnectionRoute.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end