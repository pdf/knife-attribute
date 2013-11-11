module KnifeAttribute
  module Node
    module Helpers
      include KnifeAttribute::Helpers

      def self.included(base)
        base.class_eval do
          deps do
            require 'chef/node'
            require 'chef/json_compat'
          end
        end
      end

      def node
        @node ||= Chef::Node.load(entity_name)
      end

      def entity_type
        :node
      end
    end
  end
end
