require "icy/form/version"

# TODO: handle nested data and arrays of data
# TODO: give it a prefix/name (n.b. not here, but actually in the view part)

# FIXME: so at/each won't necessarily work for "new" forms? i.e. with empty hash?

module Icy
  class Form
    require "icy/form/view/form_part"

    UNDEFINED = Object.new.freeze
    EMPTY_HASH = {}.freeze

    attr_reader :attributes

    def self.empty
      new(EMPTY_HASH, EMPTY_HASH)
    end

    def initialize(attributes, messages: UNDEFINED)
      @attributes = attributes.to_h
      @messages =
        if messages != UNDEFINED
          messages
        elsif attributes.respond_to?(:messages)
           attributes.messages
        else
          EMPTY_HASH
        end
    end

    def value(key)
      @attributes[key]
    end
    alias_method :[], :value

    def messages(key = UNDEFINED)
      if key == UNDEFINED
        @messages
      else
        @messages[key]
      end
    end

    def messages?(key = UNDEFINED)
      if key == UNDEFINED
        @messages.any?
      else
        @messages.key?(key)
      end
    end

    # TODO
    # def each_message

    # TODO: make sure this works fine with empty forms
    # def at(key)
    #   attributes = @attributes.fetch(key) { {} }
    #   messages = @messages.fetch(key) { {} }
    #   self.class.new(attributes, messages: messages)
    # end

    # TODO: gotta make sure this works fine with empty forms
    # def each(key)
    #   attributes = @attributes.fetch(key) { [] }
    #   messages = @messages.fetch(key) { [] } # TODO: work out what dry-v actually does for this
    #   # yield each
    # end
  end
end
