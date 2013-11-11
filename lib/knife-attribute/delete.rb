module KnifeAttribute
  module Delete
    def self.included(base)
      base.class_eval do
        include KnifeAttribute::CommonOptions

        def run
          check_arguments

          if config[:attribute_type]
            delete_attribute(entity.send(attribute_type_map[config[:attribute_type].to_sym]))
          else
            delete_attribute(entity.send(attribute_type_map[default_attribute_type]))
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
