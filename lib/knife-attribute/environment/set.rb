module KnifeAttribute
  module Environment
    class EnvironmentAttributeSet < Chef::Knife
      include KnifeAttribute::Environment::Helpers
      include KnifeAttribute::Set

      banner 'knife environment attribute set ENVIRONMENT PERIOD.SEPARATED.ATTRIBUTE STRING_OR_JSON_VALUE (options)'

    end
  end
end
