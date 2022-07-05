require_relative "lib/widgets/version"

Gem::Specification.new do |spec|
  spec.name = "widgets"
  spec.version = Widgets::VERSION
  spec.authors = ["John Allen"]
  spec.email = ["john@threedogconsulting.com"]

  spec.summary = "Build widgets"
  spec.description = "Build widgets"
  spec.homepage = "http://github.com/johnallen3d/widgets"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/johnalle3d"

  spec.files = Dir['lib/**/*.*']
  spec.require_paths = ["lib"]
end

