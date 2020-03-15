require 'smart_proxy_reboot/reboot_api'

map '/reboot' do
  run Proxy::Reboot::Api
end
