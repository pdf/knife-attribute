module KnifeAttribute
  module Role
    class RoleAttributeGet < Chef::Knife
      include KnifeAttribute::Role::Helpers
      include KnifeAttribute::Get

      banner 'knife role attribute get ROLE PERIOD.SEPARATED.ATTRIBUTE (options)'

    end
  end
end
