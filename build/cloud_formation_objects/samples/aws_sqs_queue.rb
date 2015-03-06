require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::SQS::Queue
        ##
        class SQSQueue < Resource


          property :delay_seconds, 'DelaySeconds'
          property :maximum_message_size, 'MaximumMessageSize'
          property :message_retention_period, 'MessageRetentionPeriod'
          property :queue_name, 'QueueName'
          property :receive_message_wait_time_seconds, 'ReceiveMessageWaitTimeSeconds'
          property :redrive_policy, 'RedrivePolicy'
          property :visibility_timeout, 'VisibilityTimeout'

          def initialize(*args)
            super
            type 'AWS::SQS::Queue'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_sqs_queue(name, &block)
        r = Model::Template::Resource::SQSQueue.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end