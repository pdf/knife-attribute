module KnifeAttribute
  module Node
    class NodeAttributeDelete < Chef::Knife
      include KnifeAttribute::CommonOptions
      include KnifeAttribute::Node::Helpers

      banner 'knife node attribute delete NODE PERIOD.SEPARATED.ATTRIBUTE (options)'

      def run
        check_arguments

        case config[:attribute_type]
        when 'default'
          delete_attribute(node.default_attrs)
        when 'override'
          delete_attribute(node.override_attrs)
        when 'automatic'
          delete_attribute(node.automatic_attrs)
        when 'normal'
          delete_attribute(node.normal_attrs)
        else
          delete_attribute(node.normal_attrs)
        end
      end

      private
        def check_arguments
          if node_name.nil?
            show_usage
            ui.fatal('You must specify a node name')
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
            parent = path.inject(target) { |obj, item| obj[item] || break }
          end

          result = false
          if parent and parent.has_key?(key)
            parent.delete(key)
            result = node.save
          end

          if result
            ui.info("Successfully deleted node #{ui.color(node_name, :cyan)} attribute #{ui.color(attribute, :green)}")
          else
            ui.fatal("Failed deleting node #{ui.color(node_name, :magenta)} attribute #{ui.color(new_attribute, :magenta)}")
            exit 1
          end
        end
    end
  end
end
