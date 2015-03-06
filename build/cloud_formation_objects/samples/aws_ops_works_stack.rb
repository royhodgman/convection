require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::OpsWorks::Stack
        ##
        class OpsWorksStack < Resource


          property :chef_configuration, 'ChefConfiguration'
          property :configuration_manager, 'ConfigurationManager'
          property :custom_cookbooks_source, 'CustomCookbooksSource'
          property :custom_json, 'CustomJson'
          property :default_availability_zone, 'DefaultAvailabilityZone'
          property :default_instance_profile_arn, 'DefaultInstanceProfileArn'
          property :default_os, 'DefaultOs'
          property :default_root_device_type, 'DefaultRootDeviceType'
          property :default_ssh_key_name, 'DefaultSshKeyName'
          property :default_subnet_id, 'DefaultSubnetId'
          property :hostname_theme, 'HostnameTheme'
          property :name, 'Name'
          property :service_role_arn, 'ServiceRoleArn'
          property :use_custom_cookbooks, 'UseCustomCookbooks'
          property :use_opsworks_security_groups, 'UseOpsworksSecurityGroups'
          property :vpc_id, 'VpcId'

          def initialize(*args)
            super
            type 'AWS::OpsWorks::Stack'

            @properties['Attributes'] = []
          end

          def attributes(value)
            @properties['Attributes'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ops_works_stack(name, &block)
        r = Model::Template::Resource::OpsWorksStack.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end