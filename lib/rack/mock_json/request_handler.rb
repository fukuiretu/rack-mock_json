module Rack
  module MockJson
    class RequestHandler
      def initialize(app, config_file_path: nil)
        @app = app
        @mock = Rack::MockJson::Mock.new(config_file_path)
      end

      def call(env)
        mock_element = @mock.mock_element(request_path(env))

        return @app.call(env) if mock_element.nil?

        [
          mock_element.status,
          {
            
            "Content-Type"           => "application/json",
            "Content-Length"         =>  mock_element.content.bytesize.to_s,
            "X-XSS-Protection"       => "1; mode=block",
            "X-Content-Type-Options" => "nosniff",
            "X-Frame-Options"        => "SAMEORIGIN"
          },
          [mock_element.content]
        ]
      end

      private

        def request_path(env)
          "#{request_method(env)} #{path_info(env)}"
        end

        def path_info(env)
          env["PATH_INFO"]
        end

        def request_method(env)
          env["REQUEST_METHOD"]
        end
    end
  end
end
