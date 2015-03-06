require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::UserToGroupAddition
        ##
        class IAMUserToGroupAddition < Resource


          property :group_name, 'GroupName'

          def initialize(*args)
            super
            type 'AWS::IAM::UserToGroupAddition'

            @properties['Users'] = []
          end

          def users(value)
            @properties['Users'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_iam_user_to_group_addition(name, &block)
        r = Model::Template::Resource::IAMUserToGroupAddition.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end