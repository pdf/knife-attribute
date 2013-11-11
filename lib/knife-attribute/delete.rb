module KnifeAttribute
  module Delete
    def self.included(base)
      base.class_eval do
        include KnifeAttribute::CommonOptions

        def run
          check_arguments

          case config[:attribute_type]
          when 'default'
            delete_attribute(entity.default_attrs)
          when 'override'
            delete_attribute(entity.override_attrs)
          when 'automatic'
            delete_attribute(entity.automatic_attrs)
          when 'normal'
            delete_attribute(entity.normal_attrs)
          else
            delete_attribute(entity.normal_attrs)
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

          def delete_attribute(target)
            path = attribute.split('.')
            key = path.pop

            if path.length == 0
              parent = target
            else
              parent = path.inject(target) { |obj, subkey| obj[subkey] || break }
            end

            result = false
            if parent and parent.has_key?(key)
              parent.delete(key)
              result = entity.save
            end

            if result
              ui.info("Successfully deleted #{entity_type.to_s} #{ui.color(entity_name, :cyan)} attribute #{ui.color(attribute, :green)}")
            else
              ui.fatal("Failed deleting #{entity_type.to_s} #{ui.color(entity_name, :magenta)} attribute #{ui.color(new_attribute, :magenta)}")
              exit 1
            end
          end
      end
    end
  end
end
