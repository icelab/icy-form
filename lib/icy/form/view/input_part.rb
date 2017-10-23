require "icy/form/view/part"

module Icy
  class Form
    module View
      class InputPart < Part
        # Make it nicer to render different partials in the template, e.g.:
        #
        # == input.text_field
        # == input.text_area
        def method_missing(name, *args, &block)
          if form_partial?(name)
            render_form_partial(name, *args, &block)
          else
            super
          end
        end
      end
    end
  end
end
