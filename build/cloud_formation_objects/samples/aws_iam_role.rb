require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::Role
        ##
        class IAMRole < Resource


          property :assume_role_policy_document, 'AssumeRolePolicyDocument'
          property :path, 'Path'

          def initialize(*args)
            super
            type 'AWS::IAM::Role'

            @properties['Policies'] = []
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
      def aws_iam_role(name, &block)
        r = Model::Template::Resource::IAMRole.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end