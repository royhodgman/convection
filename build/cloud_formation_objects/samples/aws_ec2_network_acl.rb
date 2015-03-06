require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::NetworkAcl
        ##
        class EC2NetworkAcl < Resource

          include Model::Mixin::Taggable

          property :tags, 'Tags'
          property :vpc_id, 'VpcId'

          def initialize(*args)
            super
            type 'AWS::EC2::NetworkAcl'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_network_acl(name, &block)
        r = Model::Template::Resource::EC2NetworkAcl.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end