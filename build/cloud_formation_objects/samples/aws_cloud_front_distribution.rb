require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudFront::Distribution
        ##
        class CloudFrontDistribution < Resource


          property :distribution_config, 'DistributionConfig'

          def initialize(*args)
            super
            type 'AWS::CloudFront::Distribution'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_front_distribution(name, &block)
        r = Model::Template::Resource::CloudFrontDistribution.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end