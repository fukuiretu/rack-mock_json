rack-mock_json
====================
[![Gem Version](https://badge.fury.io/rb/rack-mock_json.svg)](http://badge.fury.io/rb/rack-mock_json)
[![Circle CI](https://circleci.com/gh/fukuiretu/rack-mock_json.svg?style=svg)](https://circleci.com/gh/fukuiretu/rack-mock_json)


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
  config.middleware.use Rack::MockJson::Middleware, config_file_path: "#{config.root}/config/mock_json.yml"
end

```

[Examples For more information, click here](example/rails-example/config/environments/development.rb)

### Config

```yaml
- request_path: 'GET /users'
  contents:
    - '{ "name": "retu", "age" : "20" }'
    - '{ "name": "jane", "age" : "25" }'
- request_path: 'POST /user'
  status: 201
  contents:
    - '{ "name": "taro", "age" : 17 }'
```

If you have multiple elements specified in the `contents`, and then picked up at random. Also, if you specify the `mock_element_index=i` in parameter, and it returns a particular element.

Ex.

```sh
$ curl http://localhost:3000/users -X GET -d "mock_element_index=0"
{ "name": "retu", "age" : "20" }
$ curl http://localhost:3000/users -X GET -d "mock_element_index=1"
{ "name": "jane", "age" : "25" }
```

| Propety        | Required     | Default     | Remarks            |
| :------------- | :------------| :-----------| :------------------|
| request_path   | ○            | -           | Use the regular expression |
| status         | ×            | 200         | HTTP Status |
| contents       | ○            | -           | Body Content |

[Examples For more information, click here](example/rails-example/config/mock_json.yml)



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
