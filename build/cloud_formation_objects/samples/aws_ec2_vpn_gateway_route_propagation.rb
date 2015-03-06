require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::VPNGatewayRoutePropagation
        ##
        class EC2VPNGatewayRoutePropagation < Resource


          property :vpn_gateway_id, 'VpnGatewayId'

          def initialize(*args)
            super
            type 'AWS::EC2::VPNGatewayRoutePropagation'

            @properties['RouteTableIds'] = []
          end

          def route_table_ids(value)
            @properties['RouteTableIds'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_vpn_gateway_route_propagation(name, &block)
        r = Model::Template::Resource::EC2VPNGatewayRoutePropagation.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end