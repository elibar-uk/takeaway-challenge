require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message
  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(sms)
      @client.account.messages.create({
      :from => ENV['FROM_NUMBER'],
      :to => ENV['TO_NUMBER'],
      :body => sms
    })
  end
  'sms'
end
