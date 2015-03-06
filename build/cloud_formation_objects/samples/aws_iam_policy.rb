require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::Policy
        ##
        class IAMPolicy < Resource


          property :policy_document, 'PolicyDocument'
          property :policy_name, 'PolicyName'

          def initialize(*args)
            super
            type 'AWS::IAM::Policy'

            @properties['Groups'] = []
            @properties['Roles'] = []
            @properties['Users'] = []
          end

          def groups(value)
            @properties['Groups'] << value
          end
                    def roles(value)
            @properties['Roles'] << value
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
      def aws_iam_policy(name, &block)
        r = Model::Template::Resource::IAMPolicy.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end