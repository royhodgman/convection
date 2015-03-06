require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::NetworkInterface
        ##
        class EC2NetworkInterface < Resource

          include Model::Mixin::Taggable

          property :description, 'Description'
          property :private_ip_address, 'PrivateIpAddress'
          property :secondary_private_ip_address_count, 'SecondaryPrivateIpAddressCount'
          property :source_dest_check, 'SourceDestCheck'
          property :subnet_id, 'SubnetId'
          property :tags, 'Tags'

          def initialize(*args)
            super
            type 'AWS::EC2::NetworkInterface'

            @properties['GroupSet'] = []
            @properties['PrivateIpAddresses'] = []
          end

          def group_set(value)
            @properties['GroupSet'] << value
          end
                    def private_ip_addresses(value)
            @properties['PrivateIpAddresses'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_network_interface(name, &block)
        r = Model::Template::Resource::EC2NetworkInterface.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end