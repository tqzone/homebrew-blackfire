require File.join(File.dirname(__FILE__), 'blackfire-php-extension')

class BlackfirePhp56 < BlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '0.18.0'

    url 'http://packages.blackfire.io/homebrew/blackfire-php_0.18.0-darwin_amd64-php56.tar.gz'
    sha1 'd5d562875292eba5245885d45d975aad18842e1a'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<-EOS.undent
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        blackfire.agent_timeout = 0.25
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log
        ;blackfire.server_id =
        ;blackfire.server_token =
        EOS
    end
end
