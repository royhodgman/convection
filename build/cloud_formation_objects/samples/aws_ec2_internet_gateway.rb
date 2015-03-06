require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::InternetGateway
        ##
        class EC2InternetGateway < Resource

          include Model::Mixin::Taggable

          property :tags, 'Tags'

          def initialize(*args)
            super
            type 'AWS::EC2::InternetGateway'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_internet_gateway(name, &block)
        r = Model::Template::Resource::EC2InternetGateway.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end