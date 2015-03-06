require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Redshift::ClusterSecurityGroup
        ##
        class RedshiftClusterSecurityGroup < Resource


          property :description, 'Description'

          def initialize(*args)
            super
            type 'AWS::Redshift::ClusterSecurityGroup'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_redshift_cluster_security_group(name, &block)
        r = Model::Template::Resource::RedshiftClusterSecurityGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end