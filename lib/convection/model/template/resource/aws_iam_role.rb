require_relative '../resource'

module Convection
  module DSL
    ## Add DSL method to template namespace
    module Template
      def iam_role(name, &block)
        r = Model::Template::Resource::IAMRole.new(name, self)
        r.instance_exec(&block) if block

        resources[name] = r
      end
    end
  end

  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::Role
        ##
        class IAMRole < Resource
          property :path, 'Path'
          property :trust_relationship, 'AssumeRolePolicyDocument'

          def initialize(*args)
            super

            type 'AWS::IAM::Role'
            @properties['Policies'] = []
          end

          def policy(value)
            @properties['Policies'] << value
          end
        end
      end
    end
  end
end
