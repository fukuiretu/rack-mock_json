# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/mock_json/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-mock_json"
  spec.version       = Rack::MockJson::VERSION
  spec.authors       = ["fukuiretu"]
  spec.email         = ["s0232101@gmail.com"]

  spec.summary       = %q{any request in the rack layer, returns any json response(Content-Type: application/json) and http status.}
  spec.description   = %q{any request in the rack layer, returns any json response(Content-Type: application/json) and http status.}
  spec.homepage      = "https://github.com/fukuiretu/rack-mock_json"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
