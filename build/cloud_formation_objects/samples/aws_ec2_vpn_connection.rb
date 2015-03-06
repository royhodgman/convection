require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::VPNConnection
        ##
        class EC2VPNConnection < Resource

          include Model::Mixin::Taggable

          property :type, 'Type'
          property :customer_gateway_id, 'CustomerGatewayId'
          property :static_routes_only, 'StaticRoutesOnly'
          property :tags, 'Tags'
          property :vpn_gateway_id, 'VpnGatewayId'

          def initialize(*args)
            super
            type 'AWS::EC2::VPNConnection'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_vpn_connection(name, &block)
        r = Model::Template::Resource::EC2VPNConnection.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end