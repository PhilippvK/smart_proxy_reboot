require 'test_helper'
require 'webmock/test_unit'
require 'mocha/test_unit'
require 'rack/test'

require 'smart_proxy_reboot/reboot'
require 'smart_proxy_reboot/reboot_api'

class ExampleApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::Reboot::Api.new
  end

  def test_reboot
    # add test here
  end

end
