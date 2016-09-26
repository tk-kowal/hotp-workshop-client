class HOTP
  def initialize(secret, counter)
    @secret = secret
    @counter = counter
  end

  def get
    # returns the one time password as a six digit string (e.g "123456")
  end

end
