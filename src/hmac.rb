require 'digest'
require 'openssl'

class HMAC
  def self.digest(key, message)
    OpenSSL::HMAC.new(key, OpenSSL::Digest.new('sha1')).update(message).digest
  end
end
