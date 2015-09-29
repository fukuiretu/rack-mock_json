require "rack/mock_json"
require "rack/test"
require "json_spec"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  
  config.include JsonSpec::Helpers
end
