require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::VPCGatewayAttachment
        ##
        class EC2VPCGatewayAttachment < Resource


          property :internet_gateway_id, 'InternetGatewayId'
          property :vpc_id, 'VpcId'
          property :vpn_gateway_id, 'VpnGatewayId'

          def initialize(*args)
            super
            type 'AWS::EC2::VPCGatewayAttachment'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_vpc_gateway_attachment(name, &block)
        r = Model::Template::Resource::EC2VPCGatewayAttachment.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end