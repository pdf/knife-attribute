module KnifeAttribute
  module Node
    class NodeAttributeSet < Chef::Knife
      include KnifeAttribute::Node::Helpers
      include KnifeAttribute::Set

      banner 'knife node attribute set NODE PERIOD.SEPARATED.ATTRIBUTE STRING_OR_JSON_VALUE (options)'

    end
  end
end
