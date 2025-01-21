require_relative "lib/version"

Gem::Specification.new do |spec|
  spec.name          = "kamal-credstash-adapter"
  spec.version       = KamalCredstashAdapter::VERSION
  spec.authors       = ["David Morton"]
  spec.email         = ["dmorton@wested.org"]

  spec.summary       = "Credstash adapter for Kamal secrets management"
  spec.description   = "Integration between Kamal deployment tool and Credstash secrets management"
  spec.homepage      = "https://github.com/wested/kamal-credstash-adapter"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => spec.homepage,
    "changelog_uri"     => "#{spec.homepage}/blob/main/CHANGELOG.md"
  }

  spec.files = Dir["lib/**/*", "README.md", "LICENSE.txt", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "kamal", ">= 2.0.0"
  spec.add_dependency "zeitwerk", "~> 2.6"
end
