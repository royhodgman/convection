require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudTrail::Trail
        ##
        class CloudTrailTrail < Resource


          property :include_global_service_events, 'IncludeGlobalServiceEvents'
          property :is_logging, 'IsLogging'
          property :s3_bucket_name, 'S3BucketName'
          property :s3_key_prefix, 'S3KeyPrefix'
          property :sns_topic_name, 'SnsTopicName'

          def initialize(*args)
            super
            type 'AWS::CloudTrail::Trail'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_trail_trail(name, &block)
        r = Model::Template::Resource::CloudTrailTrail.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end