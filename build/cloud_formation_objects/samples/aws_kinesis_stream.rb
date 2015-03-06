require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Kinesis::Stream
        ##
        class KinesisStream < Resource


          property :shard_count, 'ShardCount'

          def initialize(*args)
            super
            type 'AWS::Kinesis::Stream'

          end

          

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_kinesis_stream(name, &block)
        r = Model::Template::Resource::KinesisStream.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end