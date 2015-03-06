require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Redshift::ClusterSecurityGroupIngress
        ##
        class RedshiftClusterSecurityGroupIngress < Resource


          property :cluster_security_group_name, 'ClusterSecurityGroupName'
          property :cidrip, 'CIDRIP'
          property :ec2_security_group_name, 'EC2SecurityGroupName'
          property :ec2_security_group_owner_id, 'EC2SecurityGroupOwnerId'

          def initialize(*args)
            super
            type 'AWS::Redshift::ClusterSecurityGroupIngress'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_redshift_cluster_security_group_ingress(name, &block)
        r = Model::Template::Resource::RedshiftClusterSecurityGroupIngress.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end