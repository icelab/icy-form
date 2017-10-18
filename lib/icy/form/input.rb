module Icy
  class Form
    class Input
      attr_reader :prefix, :key, :value, :messages

      def initialize(prefix: nil, key:, value:, messages:)
        @prefix = prefix
        @key = key
        @value = value
        @messages = messages
      end

      def identifier
        [prefix, key].compact.join("__")
      end

      def name
        if prefix
          "#{prefix}[#{key}]"
        else
          key
        end
      end

      def label
        # TODO: make better
        key.capitalize
      end
    end
  end
end
