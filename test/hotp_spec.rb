require 'rspec'
require_relative '../src/hotp.rb'

class StubbedCounter
  attr_reader :get
  def initialize(get)
    @get = get
  end
end

describe HOTP do
  let(:secret) { "12345678901234567890" }

  [
    #Count    Hexadecimal    Decimal        HOTP
    { count: StubbedCounter.new(0), otp: "755224" },
    { count: StubbedCounter.new(1), otp: "287082" },
    { count: StubbedCounter.new(2), otp: "359152" },
    { count: StubbedCounter.new(3), otp: "969429" },
    { count: StubbedCounter.new(4), otp: "338314" },
    { count: StubbedCounter.new(5), otp: "254676" },
    { count: StubbedCounter.new(6), otp: "287922" },
    { count: StubbedCounter.new(7), otp: "162583" },
    { count: StubbedCounter.new(8), otp: "399871" },
    { count: StubbedCounter.new(9), otp: "520489" }
  ].each do |data|
    it "given #{data[:count]} it returns #{data[:otp]}" do
      hotp = HOTP.new(secret, data[:count])
      expect(hotp.get).to eq(data[:otp])
    end
  end
end
