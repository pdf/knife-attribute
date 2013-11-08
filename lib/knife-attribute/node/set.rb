module KnifeAttribute
  module Node
    class NodeAttributeSet < Chef::Knife
      include KnifeAttribute::CommonOptions
      include KnifeAttribute::Node::Helpers

      banner 'knife node attribute set NODE PERIOD.SEPARATED.ATTRIBUTE STRING_OR_JSON_VALUE (options)'

      def run
        check_arguments

        case config[:attribute_type]
        when 'default'
          set_attribute(node.default_attrs)
        when 'override'
          set_attribute(node.override_attrs)
        when 'automatic'
          set_attribute(node.automatic_attrs)
        when 'normal', nil
          set_attribute(node.normal_attrs)
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

          if value.nil?
            show_usage
            ui.fatal('You must specify a value')
            exit 1
          end

          check_type
        end

        def set_attribute(target)
          begin
            new_value = Chef::JSONCompat.from_json(value)
          rescue JSON::ParserError, Yajl::ParseError
            new_value = value
          end
          new_attribute = attribute.split('.').reverse.inject(new_value) { |result, key| { key => result } }
          target.merge!(new_attribute)

          if node.save
            ui.info("Successfully set node #{ui.color(node_name, :cyan)} attribute #{ui.color(attribute, :cyan)} to: #{ui.color(new_value.inspect, :green)}")
          else
            ui.fatal("Failed updating node #{ui.color(node_name, :magenta)} attribute #{ui.color(new_attribute, :magenta)}")
            exit 1
          end
        end
    end
  end
end
