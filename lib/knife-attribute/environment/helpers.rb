module KnifeAttribute
  module Environment
    module Helpers
      include KnifeAttribute::Helpers

      def self.included(base)
        base.class_eval do
          deps do
            require 'chef/json_compat'
          end

          def self.attribute_type_map
            {
              default: :default_attributes,
              override: :override_attributes,
            }
          end

          def self.default_attribute_type
            :default
          end
        end
      end

      def environment
        @environment ||= Chef::Environment.load(entity_name)
      end

      def entity_type
        :environment
      end
    end
  end
end
