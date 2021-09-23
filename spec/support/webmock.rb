require "webmock/rspec"

WebMock.disable_net_connect!(allow_localhost: true)
WebMock.disable_net_connect!(allow: ['http://localhost:3000'])

