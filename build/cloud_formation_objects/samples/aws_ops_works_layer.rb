require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::OpsWorks::Layer
        ##
        class OpsWorksLayer < Resource


          property :auto_assign_elastic_ips, 'AutoAssignElasticIps'
          property :auto_assign_public_ips, 'AutoAssignPublicIps'
          property :custom_instance_profile_arn, 'CustomInstanceProfileArn'
          property :custom_recipes, 'CustomRecipes'
          property :enable_auto_healing, 'EnableAutoHealing'
          property :install_updates_on_boot, 'InstallUpdatesOnBoot'
          property :name, 'Name'
          property :shortname, 'Shortname'
          property :stack_id, 'StackId'
          property :type, 'Type'
          property :volume_configurations, 'VolumeConfigurations'

          def initialize(*args)
            super
            type 'AWS::OpsWorks::Layer'

            @properties['Attributes'] = []
            @properties['CustomSecurityGroupIds'] = []
            @properties['Packages'] = []
          end

          def attributes(value)
            @properties['Attributes'] << value
          end
                    def custom_security_group_ids(value)
            @properties['CustomSecurityGroupIds'] << value
          end
                    def packages(value)
            @properties['Packages'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ops_works_layer(name, &block)
        r = Model::Template::Resource::OpsWorksLayer.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end