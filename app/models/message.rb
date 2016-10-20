class Message < ApplicationRecord
  after_create :send_sms

  def contact
    "#{self.name} (#{self.phone || self.email})"
  end

  def send_sms
    client = EasySMS::Client.new
    Agent.find_each do |agent|
      client.messages.create to: "+1#{agent.phone}", body: "New Message from #{contact}, \n #{self.content}"
    end
  end
end
