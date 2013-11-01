module KnifeAttribute
  module CommonOptions
    def self.included(base)
      base.class_eval do
        option :attribute_type,
          short: '-t TYPE',
          long: '--type TYPE',
          default: 'normal',
          description: "Attribute type to set, one of: #{KnifeAttribute::ATTRIBUTE_TYPES} (default: 'normal')"
      end
    end

    def check_type
      if config[:attribute_type] and !KnifeAttribute::ATTRIBUTE_TYPES.include?(config[:attribute_type])
        show_usage
        ui.fatal("Invalid attribute type: '#{config[:attribute_type]}'")
      end
    end
  end
end
