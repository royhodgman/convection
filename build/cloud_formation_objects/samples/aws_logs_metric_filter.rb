require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::Logs::MetricFilter
        ##
        class LogsMetricFilter < Resource


          property :log_group_name, 'LogGroupName'

          def initialize(*args)
            super
            type 'AWS::Logs::MetricFilter'

            @properties['FilterPattern'] = []
            @properties['MetricTransformations'] = []
          end

          def filter_pattern(value)
            @properties['FilterPattern'] << value
          end
                    def metric_transformations(value)
            @properties['MetricTransformations'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_logs_metric_filter(name, &block)
        r = Model::Template::Resource::LogsMetricFilter.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end