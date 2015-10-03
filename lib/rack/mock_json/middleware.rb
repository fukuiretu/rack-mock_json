module Rack
  module MockJson
    class Middleware
      def initialize(app, config_file_path: nil)
        @app = app
        @mock = Rack::MockJson::Mock.new(config_file_path)
      end

      def call(env)
        @request = Rack::Request.new(env)

        mock_element = @mock.mock_element(request_path)
        return @app.call(env) if mock_element.nil?

        content = mock_element.pick_content(mock_element_index)
        [
          mock_element.status,
          {
            "Content-Type"           => "application/json",
            "Content-Length"         =>  content.bytesize.to_s,
            "X-XSS-Protection"       => "1; mode=block",
            "X-Content-Type-Options" => "nosniff",
            "X-Frame-Options"        => "SAMEORIGIN"
          },
          [content]
        ]
      end

      private

        def request_path
          "#{@request.request_method} #{@request.path_info}"
        end

        def mock_element_index
          @request.params["mock_element_index"] ? @request.params["mock_element_index"].to_i : nil
        end
    end
  end
end
