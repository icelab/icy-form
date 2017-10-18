require "bundler/setup"
require "pathname"

require "icy/form"
require "dry/view/controller"
require "slim"

SPEC_ROOT = Pathname(__dir__)
FIXTURES_PATH = SPEC_ROOT.join("fixtures").freeze

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
