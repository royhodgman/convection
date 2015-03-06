require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::SecurityGroup
        ##
        class EC2SecurityGroup < Resource

          include Model::Mixin::Taggable

          property :group_description, 'GroupDescription'
          property :security_group_egress, 'SecurityGroupEgress'
          property :security_group_ingress, 'SecurityGroupIngress'
          property :tags, 'Tags'
          property :vpc_id, 'VpcId'

          def initialize(*args)
            super
            type 'AWS::EC2::SecurityGroup'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_security_group(name, &block)
        r = Model::Template::Resource::EC2SecurityGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end