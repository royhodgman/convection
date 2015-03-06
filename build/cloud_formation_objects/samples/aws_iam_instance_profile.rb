require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::IAM::InstanceProfile
        ##
        class IAMInstanceProfile < Resource


          property :path, 'Path'

          def initialize(*args)
            super
            type 'AWS::IAM::InstanceProfile'

            @properties['Roles'] = []
          end

          def roles(value)
            @properties['Roles'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_iam_instance_profile(name, &block)
        r = Model::Template::Resource::IAMInstanceProfile.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end