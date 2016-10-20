class Message < ApplicationRecord
  after_create :send_sms

  def contact
    "#{self.name} (#{self.phone || self.email})"
  end

  def send_sms
    client = EasySMS::Client.new
    client.messages.create to: '+18016374393', body: "New Message from #{contact}, \n #{self.content}"
  end
end
