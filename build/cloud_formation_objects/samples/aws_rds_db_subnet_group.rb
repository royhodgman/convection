require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::RDS::DBSubnetGroup
        ##
        class RDSDBSubnetGroup < Resource

          include Model::Mixin::Taggable

          property :db_subnet_group_description, 'DBSubnetGroupDescription'

          def initialize(*args)
            super
            type 'AWS::RDS::DBSubnetGroup'

            @properties['SubnetIds'] = []
            @properties['Tags'] = []
          end

          def subnet_ids(value)
            @properties['SubnetIds'] << value
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
      def aws_rds_db_subnet_group(name, &block)
        r = Model::Template::Resource::RDSDBSubnetGroup.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end