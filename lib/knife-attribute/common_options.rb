module KnifeAttribute
  module CommonOptions
    def self.included(base)
      base.class_eval do
        option :attribute_type,
          short: '-t TYPE',
          long: '--type TYPE',
          description: "Attribute type, one of: #{attribute_type_map.keys.map(&:to_s)} (default: '#{default_attribute_type.to_s}')"
      end
    end

    def check_type
      if config[:attribute_type] and !attribute_type_map.keys.include?(config[:attribute_type].to_sym)
        show_usage
        ui.fatal("Invalid attribute type: '#{config[:attribute_type]}'")
      end
    end
  end
end
