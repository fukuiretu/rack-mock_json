module Rack
  module MockJson
    class RequestHandler
      def initialize(app, config_file_path: nil)
        @app = app
        @mock = Rack::MockJson::Mock.new(config_file_path)
      end

      def call(env)
        if path_info(env) == '/hoge'
          content = '{"hoge": "foo"}'
          [
            200,
            {
              "Content-Type"           => "application/json",
              "Content-Length"         =>  content.bytesize.to_s,
              "X-XSS-Protection"       => "1; mode=block",
              "X-Content-Type-Options" => "nosniff",
              "X-Frame-Options"        => "SAMEORIGIN"
            },
            [content]
          ]
        else
          @app.call(env)
        end
      end

      private

        def path_info(env)
          env["PATH_INFO"]
        end

        def request_method(env)
          env["REQUEST_METHOD"]
        end
    end
  end
end
