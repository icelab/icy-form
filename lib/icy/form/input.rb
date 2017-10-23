module Icy
  class Form
    class Input
      attr_reader :namespace, :key, :value, :messages, :options

      def initialize(namespace: nil, key:, value:, messages:, **options)
        @namespace = namespace
        @key = key
        @value = value
        @messages = messages
        @options = options
      end

      def identifier
        [namespace, key].compact.join("__")
      end

      # TODO: make this work for multi-level namespace
      def name
        if namespace
          "#{namespace}[#{key}]"
        else
          key
        end
      end

      def label
        options.fetch(:label) { key.capitalize } # TODO: make better, use inflections
      end
    end
  end
end
