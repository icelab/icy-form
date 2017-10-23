require "dry/view/part"

module Icy
  class Form
    module View
      class Part < Dry::View::Part
        FORM_PARTIAL_PREFIX = "icy_form/".freeze

        def new(klass = (self.class), name: (_name), value: (_value), **options)
          klass.new(
            name: name,
            value: value,
            context: _context,
            renderer: _renderer,
            **options,
          )
        end

        def render_form_partial(name, *args, &block)
          _render(form_partial(name), *args, &block)
        end

        private

        def form_partial?(name)
          !!_renderer.lookup_partial(form_partial(name))
        end

        def form_partial(name)
          "#{FORM_PARTIAL_PREFIX}#{name}"
        end
      end
    end
  end
end
