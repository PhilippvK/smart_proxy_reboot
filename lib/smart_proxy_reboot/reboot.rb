module Proxy::Reboot
  class NotFound < RuntimeError; end

  class Plugin < ::Proxy::Plugin
    plugin 'reboot', Proxy::Reboot::VERSION

    default_settings :command => 'sudo /sbin/reboot', :user => 'foremanreboot', :keyfile_path => '/etc/foreman-proxy/id_rsa'

    http_rackup_path File.expand_path('reboot_http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('reboot_http_config.ru', File.expand_path('../', __FILE__))
  end
end
