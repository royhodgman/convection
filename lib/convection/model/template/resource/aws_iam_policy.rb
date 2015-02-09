require_relative '../resource'

module Convection
  module DSL
    ## Add DSL method to template namespace
    module Template
      def iam_policy(name, &block)
        r = Model::Template::Resource::IAMPolicy.new(name, self)
        r.instance_exec(&block) if block

        resources[name] = r
      end
    end
  end

  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::Policy
        ##
        class IAMPolicy < Resource
          def initialize(*args)
            super

            type 'AWS::IAM::Policy'
            @properties['Roles'] = []
          end

          def role(value)
            @properties['Roles'] << value
          end

          def name(value)
            property('PolicyName', value)
          end

          def policy_document(value)
            property('PolicyDocument', value)
          end
        end
      end
    end
  end
end
