require "icy/form/view/part"
require "icy/form/view/input_part"

module Icy
  class Form
    module View
      class FormPart < Part
        attr_reader :action, :method, :namespace

        # TODO: I feel like namespace should go down into the base Form class

        def initialize(action: nil, method: nil, namespace: nil, **part_args)
          @action = action
          @method = method
          @namespace = namespace

          super(part_args)
        end

        def for(action:, method:, namespace: nil, &block)
          new(
            action: action,
            method: method,
            namespace: namespace,
          ).render_form_partial(:form, &block)
        end

        def input(key, **options)
          new(InputPart, name: :input, value: _value.input(key, namespace: namespace, **options))
        end

        # def prefix(prefix)
        #   # blah blah, yield
        # end


      end
    end
  end
end
