require_relative '../resource'

module Convection
  module Model
    class Template
      class Resource
        ##
        # AWS::CloudWatch::Alarm
        ##
        class CloudWatchAlarm < Resource


          property :actions_enabled, 'ActionsEnabled'
          property :alarm_description, 'AlarmDescription'
          property :alarm_name, 'AlarmName'
          property :comparison_operator, 'ComparisonOperator'
          property :evaluation_periods, 'EvaluationPeriods'
          property :metric_name, 'MetricName'
          property :namespace, 'Namespace'
          property :period, 'Period'
          property :statistic, 'Statistic'
          property :threshold, 'Threshold'
          property :unit, 'Unit'

          def initialize(*args)
            super
            type 'AWS::CloudWatch::Alarm'

            @properties['AlarmActions'] = []
            @properties['Dimensions'] = []
            @properties['InsufficientDataActions'] = []
            @properties['OKActions'] = []
          end

          def alarm_actions(value)
            @properties['AlarmActions'] << value
          end
                    def dimensions(value)
            @properties['Dimensions'] << value
          end
                    def insufficient_data_actions(value)
            @properties['InsufficientDataActions'] << value
          end
                    def ok_actions(value)
            @properties['OKActions'] << value
          end
                    

        end
      end
    end
  end

  module DSL
    ## Add DSL method to template namespace
    module Template
      def aws_cloud_watch_alarm(name, &block)
        r = Model::Template::Resource::CloudWatchAlarm.new(name, self)

        r.instance_exec(&block) if block
        resources[name] = r
      end
    end
  end
end