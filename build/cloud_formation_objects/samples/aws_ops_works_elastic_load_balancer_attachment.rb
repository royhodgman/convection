require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::OpsWorks::ElasticLoadBalancerAttachment
        ##
        class OpsWorksElasticLoadBalancerAttachment < Resource


          property :elastic_load_balancer_name, 'ElasticLoadBalancerName'
          property :layer_id, 'LayerId'

          def initialize(*args)
            super
            type 'AWS::OpsWorks::ElasticLoadBalancerAttachment'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ops_works_elastic_load_balancer_attachment(name, &block)
        r = Model::Template::Resource::OpsWorksElasticLoadBalancerAttachment.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end