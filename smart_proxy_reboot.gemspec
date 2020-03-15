require File.expand_path('../lib/smart_proxy_reboot/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'smart_proxy_reboot'
  s.version = Proxy::Reboot::VERSION

  s.summary = 'Reboot smart proxy plugin'
  s.description = 'Reboot smart proxy plugin'
  s.authors = ['Philipp van Kempen']
  s.email = 'philipp.van-kempen@tum.de'
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = Dir['{lib,settings.d,bundler.d}/**/*'] + s.extra_rdoc_files
  s.homepage = 'http://github.com/philippvk/smart_proxy_reboot'
  s.license = 'GPLv3'
end
