require "spec_helper"

RSpec.describe "Icy::Form" do
  let(:view) do
    Class.new(Dry::View::Controller) do
      configure do |config|
        config.paths = [FIXTURES_PATH.join("templates")]
        config.template = "test"
      end

      expose :form, as: Icy::Form::View::FormPart do |input|
        Icy::Form.new(input.fetch(:form_data))
      end
    end.new
  end

  let(:form_data) {
    {title: "Hello world", body: "This is icy-form."}
  }

  let(:html) {
    view.(form_data: form_data)
  }

  it "makes form rendering a breeze" do
    expect(html).to eq strip_html(<<~HTML)
      <form action="/articles" method="post">
        <div class="input">
          <label for="article__title">Title</label>
          <input id="article__title" name="article[title]" type="text" value="Hello world" />
        </div>
      </form>
    HTML
  end

  def strip_html(html)
    html.gsub(%r{^\s+}, "").gsub("\n", "")
  end
end
