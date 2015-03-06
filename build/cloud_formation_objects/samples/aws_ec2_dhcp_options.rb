require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::EC2::DHCPOptions
        ##
        class EC2DHCPOptions < Resource

          include Model::Mixin::Taggable

          property :domain_name, 'DomainName'
          property :tags, 'Tags'

          def initialize(*args)
            super
            type 'AWS::EC2::DHCPOptions'

            @properties['DomainNameServers'] = []
            @properties['NetbiosNameServers'] = []
            @properties['NetbiosNodeType'] = []
            @properties['NtpServers'] = []
          end

          def domain_name_servers(value)
            @properties['DomainNameServers'] << value
          end
                    def netbios_name_servers(value)
            @properties['NetbiosNameServers'] << value
          end
                    def netbios_node_type(value)
            @properties['NetbiosNodeType'] << value
          end
                    def ntp_servers(value)
            @properties['NtpServers'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_ec2_dhcp_options(name, &block)
        r = Model::Template::Resource::EC2DHCPOptions.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end