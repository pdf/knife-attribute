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

      def node_name
        @node_name ||= @name_args[0]
      end

      def attribute
        @attribute ||= @name_args[1]
      end

      def value
        @value ||= @name_args[2]
      end

      def node
        @node ||= Chef::Node.load(node_name)
      end
    end
  end
end
