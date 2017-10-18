require "dry/view/part"

module Icy
  class Form
    module View
      class Part < Dry::View::Part
        def new(klass = (self.class), name: (_name), value: (_value), **options)
          self.class.new(
            name: name,
            value: value,
            context: _context,
            renderer: _renderer,
            **options,
          )
        end
      end
    end
  end
end
