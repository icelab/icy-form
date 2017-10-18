require "icy/form/input"
require "icy/form/view/part"
require "icy/form/view/input_part"

module Icy
  class Form
    module View
      class FormPart < Part
        attr_reader :action, :method, :prefix

        def initialize(action: nil, method: nil, prefix: nil, **part_args)
          @action = action
          @method = method
          @prefix = prefix

          super(part_args)
        end

        def for(action:, method:, prefix: nil, &block)
          new(
            action: action,
            method: method,
            prefix: prefix,
          ).render(:icy_form, &block)
        end

        # def prefix(prefix)
        #   # blah blah, yeidl
        # end

        def input(key, **attrs)
          input = Input.new(
            prefix: prefix,
            key: key,
            value: _value.value(key),
            messages: _value.messages(key),
          )

          # TODO: something with **attrs

          new(
            InputPart,
            name: :input,
            value: input,
          ).render(:icy_form_input)
        end
      end
    end
  end
end
