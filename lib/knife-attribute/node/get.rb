module KnifeAttribute
  module Node
    class NodeAttributeGet < Chef::Knife
      include KnifeAttribute::CommonOptions
      include KnifeAttribute::Node::Helpers

      banner 'knife node attribute get NODE PERIOD.SEPARATED.ATTRIBUTE (options)'

      def run
        check_arguments

        case config[:attribute_type]
        when 'default'
          get_attribute(node.default_attrs)
        when 'override'
          get_attribute(node.override_attrs)
        when 'automatic'
          get_attribute(node.automatic_attrs)
        when 'normal'
          get_attribute(node.normal_attrs)
        else
          get_attribute(node.construct_attributes)
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

        def get_attribute(target)
          result = ui.presenter.extract_nested_value(target, attribute)
          output(format_for_display(result))
        end
    end
  end
end
