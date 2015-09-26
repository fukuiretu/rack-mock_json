module Rack
  module MockJson
    class Mock
      def initialize(config_file_path)
        puts "#{config_file_path}はyamlのそうていだよ"
      end
    end
  end
end
