require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Redshift::ClusterParameterGroup
        ##
        class RedshiftClusterParameterGroup < Resource


          property :description, 'Description'
          property :parameter_group_family, 'ParameterGroupFamily'
          property :parameters, 'Parameters'

          def initialize(*args)
            super
            type 'AWS::Redshift::ClusterParameterGroup'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_redshift_cluster_parameter_group(name, &block)
        r = Model::Template::Resource::RedshiftClusterParameterGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end