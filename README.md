rack-mock_json
====================

## Overview
`rack-mock_json` is for any request in the rack layer, returns any json response(Content-Type: application/json) and http status.

Setting it defined in `yaml`.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-mock_json'
```



## Usage

### Rails

```ruby
Rails.application.configure do
  # ...
  config.middleware.use Rack::MockJson::RequestHandler, config_file_path: "#{config.root}/config/mock_json.yml"
end

```

[Examples For more information, click here](example/rails-example/config/environments/development.rb)

### Config

```yaml
- :request_path: 'GET /hoge/.*/foo'
  :content: '{ "hoge": "foo", "bar" : "fuga" }'
- :request_path: 'POST /user'
  :status: 201
  :content: '{ "name": "taro", "age" : 17 }'
```

[Examples For more information, click here](example/rails-example/config/mock_json.yml)



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
