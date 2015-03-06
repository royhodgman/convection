require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudFormation::Authentication
        ##
        class CloudFormationAuthentication < Resource


          property :access_key_id, 'accessKeyId'
          property :password, 'password'
          property :secret_key, 'secretKey'
          property :type, 'type'
          property :username, 'username'
          property :role_name, 'roleName'

          def initialize(*args)
            super
            type 'AWS::CloudFormation::Authentication'

            @properties['buckets'] = []
            @properties['uris'] = []
          end

          def buckets(value)
            @properties['buckets'] << value
          end
                    def uris(value)
            @properties['uris'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_formation_authentication(name, &block)
        r = Model::Template::Resource::CloudFormationAuthentication.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end