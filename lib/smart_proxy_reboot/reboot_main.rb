module Proxy::Reboot
  extend ::Proxy::Util
  extend ::Proxy::Log

  class << self

    def run(nodes)
      command = Proxy::Reboot::Plugin.settings.command
      user = Proxy::Reboot::Plugin.settings.user
      keyfile_path = Proxy::Reboot::Plugin.settings.keyfile_path
      wait_for_command_to_finish = false
      cmd = []

      ssh_path = which('ssh')
      unless ssh_path
        logger.error('ssh binary is missing, aborting.')
        return false
      end
      cmd.push(ssh_path)

      cmd.push('-o', 'StrictHostKeyChecking=no')
      cmd.push("-l", user) if user

      if keyfile_path
        if File.exist?(keyfile_path)
          cmd.push("-i", keyfile_path)
        else
          logger.warn("Unable to access SSH private key:#{keyfile_path}, ignoring...")
        end
      end

      nodes.each do |node|
        shell_command(cmd + [escape_for_shell(node), command], wait_for_command_to_finish)
      end
    end
  end
end
