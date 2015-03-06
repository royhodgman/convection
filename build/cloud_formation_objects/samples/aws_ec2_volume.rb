require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::Volume
        ##
        class EC2Volume < Resource

          include Model::Mixin::Taggable

          property :availability_zone, 'AvailabilityZone'
          property :encrypted, 'Encrypted'
          property :iops, 'Iops'
          property :size, 'Size'
          property :snapshot_id, 'SnapshotId'
          property :tags, 'Tags'
          property :volume_type, 'VolumeType'

          def initialize(*args)
            super
            type 'AWS::EC2::Volume'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_volume(name, &block)
        r = Model::Template::Resource::EC2Volume.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end