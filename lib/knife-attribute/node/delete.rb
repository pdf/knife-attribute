module KnifeAttribute
  module Node
    class NodeAttributeDelete < Chef::Knife
      include KnifeAttribute::Node::Helpers
      include KnifeAttribute::Get

      banner 'knife node attribute delete NODE PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
