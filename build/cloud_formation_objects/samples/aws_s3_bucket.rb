require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::S3::Bucket
        ##
        class S3Bucket < Resource

          include Model::Mixin::Taggable

          property :access_control, 'AccessControl'
          property :bucket_name, 'BucketName'
          property :cors_configuration, 'CorsConfiguration'
          property :lifecycle_configuration, 'LifecycleConfiguration'
          property :logging_configuration, 'LoggingConfiguration'
          property :notification_configuration, 'NotificationConfiguration'
          property :tags, 'Tags'
          property :versioning_configuration, 'VersioningConfiguration'
          property :website_configuration, 'WebsiteConfiguration'

          def initialize(*args)
            super
            type 'AWS::S3::Bucket'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_s3_bucket(name, &block)
        r = Model::Template::Resource::S3Bucket.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end