module KnifeAttribute
  module Helpers
    def self.included(base)
      base.class_eval do
        def self.attribute_type_map
          fail NotImplementedError, "Missing `attribute_types` implementation for current object"
        end

        def self.default_attribute_type
          fail NotImplementedError, "Missing `default_attribute_type` implementation for current object"
        end
      end
    end
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
      @entity = send(entity_type)
    end

    def entity_type
      fail NotImplementedError, "Missing `entity_type` implementation for current object"
    end

    def attribute_type_map
      self.class.attribute_type_map
    end

    def default_attribute_type
      self.class.attribute_type_map
    end

    def mapped_config
      @mapped_config ||= config[:attribute_type] == 'normal' ? {} : {all_attributes: true}
    end
  end
end
