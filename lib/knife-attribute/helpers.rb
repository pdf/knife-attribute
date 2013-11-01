module KnifeAttribute
  module Helpers
    def mapped_config
      @mapped_config ||= config[:attribute_type] == 'normal' ? {} : {all_attributes: true}
    end
  end
end
