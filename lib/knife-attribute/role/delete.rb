module KnifeAttribute
  module Role
    class RoleAttributeDelete < Chef::Knife
      include KnifeAttribute::Role::Helpers
      include KnifeAttribute::Get

      banner 'knife role attribute delete ROLE PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
