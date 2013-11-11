module KnifeAttribute
  module Node
    class NodeAttributeGet < Chef::Knife
      include KnifeAttribute::Node::Helpers
      include KnifeAttribute::Get

      banner 'knife node attribute get NODE PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
