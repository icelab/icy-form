lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "icy/form/version"

Gem::Specification.new do |spec|
  spec.name          = "icy-form"
  spec.version       = Icy::Form::VERSION
  spec.authors       = ["Tim Riley"]
  spec.email         = ["tim@icelab.com.au"]

  spec.summary       = "Form objects for dry-view"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/icelab/icy-form"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-view", ">= 0.3.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
