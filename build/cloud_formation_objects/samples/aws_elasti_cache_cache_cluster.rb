require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::ElastiCache::CacheCluster
        ##
        class ElastiCacheCacheCluster < Resource


          property :auto_minor_version_upgrade, 'AutoMinorVersionUpgrade'
          property :cache_node_type, 'CacheNodeType'
          property :cache_parameter_group_name, 'CacheParameterGroupName'
          property :cache_subnet_group_name, 'CacheSubnetGroupName'
          property :cluster_name, 'ClusterName'
          property :engine, 'Engine'
          property :engine_version, 'EngineVersion'
          property :notification_topic_arn, 'NotificationTopicArn'
          property :num_cache_nodes, 'NumCacheNodes'
          property :port, 'Port'
          property :preferred_availability_zone, 'PreferredAvailabilityZone'
          property :preferred_maintenance_window, 'PreferredMaintenanceWindow'

          def initialize(*args)
            super
            type 'AWS::ElastiCache::CacheCluster'

            @properties['CacheSecurityGroupNames'] = []
            @properties['SnapshotArns'] = []
            @properties[' VpcSecurityGroupIds '] = []
          end

          def cache_security_group_names(value)
            @properties['CacheSecurityGroupNames'] << value
          end
                    def snapshot_arns(value)
            @properties['SnapshotArns'] << value
          end
                    def  vpc_security_group_ids (value)
            @properties[' VpcSecurityGroupIds '] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_elasti_cache_cache_cluster(name, &block)
        r = Model::Template::Resource::ElastiCacheCacheCluster.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end