module KnifeAttribute
  module Environment
    class EnvironmentAttributeGet < Chef::Knife
      include KnifeAttribute::Environment::Helpers
      include KnifeAttribute::Get

      banner 'knife environment attribute get ENVIRONMENT PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
