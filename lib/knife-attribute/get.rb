module KnifeAttribute
  module Get
    def self.included(base)
      base.class_eval do
        include KnifeAttribute::CommonOptions

        def run
          check_arguments

          if config[:attribute_type]
            get_attribute(entity.send(attribute_type_map[config[:attribute_type].to_sym]))
          elsif entity.respond_to?(:construct_attributes)
            get_attribute(entity.construct_attributes)
          else
            get_attribute(entity.send(attribute_type_map[default_attribute_type]))
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
