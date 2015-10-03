module Rack
  module MockJson
    class Element < Hashie::Dash
      property :request_path, required: true
      property :status, default: 200
      property :contents, required: true

      def pick_content(i = nil)
        return contents.sample if i.nil?
        contents[i]
      end
    end
  end
end
