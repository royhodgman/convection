require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::SNS::TopicPolicy
        ##
        class SNSTopicPolicy < Resource


          property :policy_document, 'PolicyDocument'

          def initialize(*args)
            super
            type 'AWS::SNS::TopicPolicy'

            @properties['Topics'] = []
          end

          def topics(value)
            @properties['Topics'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_sns_topic_policy(name, &block)
        r = Model::Template::Resource::SNSTopicPolicy.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end