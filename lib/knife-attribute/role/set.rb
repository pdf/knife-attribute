module KnifeAttribute
  module Role
    class RoleAttributeSet < Chef::Knife
      include KnifeAttribute::Role::Helpers
      include KnifeAttribute::Set

      banner 'knife role attribute set ROLE PERIOD.SEPARATED.ATTRIBUTE STRING_OR_JSON_VALUE (options)'

    end
  end
end
