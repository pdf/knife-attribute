module KnifeAttribute
  module Node
    class NodeAttributeGet < Chef::Knife
      include KnifeAttribute::Node::Helpers
      include KnifeAttribute::Get

      def self.attribute_type_map
        {
          default: :default_attrs,
          normal: :normal_attrs,
          override: :override_attrs,
          automatic: :automatic_attrs,
        }
      end

      banner 'knife node attribute get NODE PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
