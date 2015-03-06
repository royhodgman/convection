require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::SubnetNetworkAclAssociation
        ##
        class EC2SubnetNetworkAclAssociation < Resource


          property :subnet_id, 'SubnetId'
          property :network_acl_id, 'NetworkAclId'

          def initialize(*args)
            super
            type 'AWS::EC2::SubnetNetworkAclAssociation'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_subnet_network_acl_association(name, &block)
        r = Model::Template::Resource::EC2SubnetNetworkAclAssociation.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end