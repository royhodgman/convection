require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::SecurityGroupIngress
        ##
        class EC2SecurityGroupIngress < Resource


          property :cidr_ip, 'CidrIp'
          property :from_port, 'FromPort'
          property :group_id, 'GroupId'
          property :group_name, 'GroupName'
          property :ip_protocol, 'IpProtocol'
          property :source_security_group_id, 'SourceSecurityGroupId'
          property :source_security_group_name, 'SourceSecurityGroupName'
          property :source_security_group_owner_id, 'SourceSecurityGroupOwnerId'
          property :to_port, 'ToPort'

          def initialize(*args)
            super
            type 'AWS::EC2::SecurityGroupIngress'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_security_group_ingress(name, &block)
        r = Model::Template::Resource::EC2SecurityGroupIngress.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end