require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElastiCache::SubnetGroup 
        ##
        class ElastiCacheSubnetGroup  < Resource


          property :description, 'Description'

          def initialize(*args)
            super
            type 'AWS::ElastiCache::SubnetGroup '

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
      def aws_elasti_cache_subnet_group (name, &block)
        r = Model::Template::Resource::ElastiCacheSubnetGroup .new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end