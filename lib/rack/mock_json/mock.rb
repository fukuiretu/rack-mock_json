module Rack
  module MockJson
    class Mock
      def initialize(config_file_path)
        @config = YAML.load_file(config_file_path)
      end

      def mock_element(path)
        element = @config.find { |e| path.match(/#{e["request_path"]}/).present? }
        return nil if element.blank?

        Element.new(
          request_path: element['request_path'],
          contents: element['contents'],
          status: element['status'] ? element['status'] : 200
        )
      end
    end
  end
end
