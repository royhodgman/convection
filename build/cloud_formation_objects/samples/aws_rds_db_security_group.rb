require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::RDS::DBSecurityGroup
        ##
        class RDSDBSecurityGroup < Resource

          include Model::Mixin::Taggable

          property :ec2_vpc_id, 'EC2VpcId'
          property :group_description, 'GroupDescription'

          def initialize(*args)
            super
            type 'AWS::RDS::DBSecurityGroup'

            @properties['DBSecurityGroupIngress'] = []
            @properties['Tags'] = []
          end

          def db_security_group_ingress(value)
            @properties['DBSecurityGroupIngress'] << value
          end
                    def tags(value)
            @properties['Tags'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_rds_db_security_group(name, &block)
        r = Model::Template::Resource::RDSDBSecurityGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end