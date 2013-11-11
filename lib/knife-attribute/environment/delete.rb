module KnifeAttribute
  module Environment
    class EnvironmentAttributeDelete < Chef::Knife
      include KnifeAttribute::Environment::Helpers
      include KnifeAttribute::Delete

      banner 'knife environment attribute delete ENVIRONMENT PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
