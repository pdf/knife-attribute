module KnifeAttribute
  module Helpers
    def attribute
      @attribute ||= @name_args[1]
    end

    def value
      @value ||= @name_args[2]
    end

    def entity_name
      @entity_name ||= @name_args[0]
    end

    def entity
      if entity_type.nil? or !respond_to?(entity_type)
        fail NotImplementedError, "Missing `entity` implementation"
      else
        @entity = send(entity_type)
      end
    end

    def mapped_config
      @mapped_config ||= config[:attribute_type] == 'normal' ? {} : {all_attributes: true}
    end
  end
end
