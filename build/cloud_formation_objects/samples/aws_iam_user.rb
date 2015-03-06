require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::User
        ##
        class IAMUser < Resource


          property :path, 'Path'
          property :login_profile, 'LoginProfile'

          def initialize(*args)
            super
            type 'AWS::IAM::User'

            @properties['Groups'] = []
            @properties['Policies'] = []
          end

          def groups(value)
            @properties['Groups'] << value
          end
                    def policies(value)
            @properties['Policies'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_iam_user(name, &block)
        r = Model::Template::Resource::IAMUser.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end