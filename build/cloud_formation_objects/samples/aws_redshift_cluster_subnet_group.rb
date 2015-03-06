require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Redshift::ClusterSubnetGroup
        ##
        class RedshiftClusterSubnetGroup < Resource


          property :description, 'Description'

          def initialize(*args)
            super
            type 'AWS::Redshift::ClusterSubnetGroup'

            @properties['SubnetIds'] = []
          end

          def subnet_ids(value)
            @properties['SubnetIds'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_redshift_cluster_subnet_group(name, &block)
        r = Model::Template::Resource::RedshiftClusterSubnetGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end