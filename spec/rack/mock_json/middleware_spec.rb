require "spec_helper"

describe Rack::MockJson::Middleware do
  include Rack::Test::Methods

  let(:app) do
    Rack::MockJson::Middleware.new(
      ->(env) { [200, env, "app"] },
      config_file_path: File.expand_path("../../../config/mock_json.yml", __FILE__)
    )
  end

  describe "#call" do
    it "/hoge" do
      get("/hoge")

      body = last_response.body
      status = last_response.status

      expect(body).to have_json_path("hoge")
      expect(body).to have_json_path("bar")
      expect(body).to be_json_eql("foo".to_json).at_path("hoge")
      expect(body).to be_json_eql("fuga".to_json).at_path("bar")
      expect(status).to eq(200)
    end
  end
end
