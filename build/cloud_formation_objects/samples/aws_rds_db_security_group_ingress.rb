require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::RDS::DBSecurityGroupIngress
        ##
        class RDSDBSecurityGroupIngress < Resource


          property :cidrip, 'CIDRIP'
          property :db_security_group_name, 'DBSecurityGroupName'
          property :ec2_security_group_id, 'EC2SecurityGroupId'
          property :ec2_security_group_name, 'EC2SecurityGroupName'
          property :ec2_security_group_owner_id, 'EC2SecurityGroupOwnerId'

          def initialize(*args)
            super
            type 'AWS::RDS::DBSecurityGroupIngress'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_rds_db_security_group_ingress(name, &block)
        r = Model::Template::Resource::RDSDBSecurityGroupIngress.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end