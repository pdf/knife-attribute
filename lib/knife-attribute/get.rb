module KnifeAttribute
  module Get
    def self.included(base)
      base.class_eval do
        include KnifeAttribute::CommonOptions

        def run
          check_arguments

          case config[:attribute_type]
          when 'default'
            get_attribute(entity.default_attrs)
          when 'override'
            get_attribute(entity.override_attrs)
          when 'automatic'
            get_attribute(entity.automatic_attrs)
          when 'normal'
            get_attribute(entity.normal_attrs)
          else
            get_attribute(entity.construct_attributes)
          end
        end

        private
          def check_arguments
            if entity_name.nil?
              show_usage
              ui.fatal("You must specify a #{entity_type.to_s} name")
              exit 1
            end

            if attribute.nil?
              show_usage
              ui.fatal('You must specify an attribute')
              exit 1
            end

            check_type
          end

          def get_attribute(target)
            result = ui.presenter.extract_nested_value(target, attribute)
            output(format_for_display(result))
          end
      end
    end
  end
end
