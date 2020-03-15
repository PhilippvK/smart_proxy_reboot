require 'sinatra'
require 'smart_proxy_reboot/reboot'
require 'smart_proxy_reboot/reboot_main'

module Proxy::Reboot

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers
      
    post '/reboot' do
      begin
        log_halt 400, "Failed puppet reboot: No nodes defined" unless params[:nodes]
        log_halt 500, "Failed puppet reboot: Check Log files" unless Proxy::Reboot.run([params[:nodes]].flatten)
      rescue => e
        log_halt 500, "Failed puppet reboot: #{e}"
      end
    end
  end
end
