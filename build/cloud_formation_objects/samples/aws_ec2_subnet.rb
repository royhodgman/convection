require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::Subnet
        ##
        class EC2Subnet < Resource

          include Model::Mixin::Taggable

          property :availability_zone, 'AvailabilityZone'
          property :cidr_block, 'CidrBlock'
          property :tags, 'Tags'
          property :vpc_id, 'VpcId'

          def initialize(*args)
            super
            type 'AWS::EC2::Subnet'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_subnet(name, &block)
        r = Model::Template::Resource::EC2Subnet.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end