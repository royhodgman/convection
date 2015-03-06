require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::SecurityGroupEgress
        ##
        class EC2SecurityGroupEgress < Resource


          property :cidr_ip, 'CidrIp'
          property :destination_security_group_id, 'DestinationSecurityGroupId'
          property :from_port, 'FromPort'
          property :group_id, 'GroupId'
          property :ip_protocol, 'IpProtocol'
          property :to_port, 'ToPort'

          def initialize(*args)
            super
            type 'AWS::EC2::SecurityGroupEgress'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_security_group_egress(name, &block)
        r = Model::Template::Resource::EC2SecurityGroupEgress.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end