require File.join(File.dirname(__FILE__), 'blackfire-php-extension')

class BlackfirePhp54 < BlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '0.16.2'

    url 'http://packages.blackfire.io/homebrew/blackfire-php_0.16.2-darwin_amd64-php54.tar.gz'
    sha1 '77bc9b32c05dcbcfd379d1ae1396e97fc676f953'

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
