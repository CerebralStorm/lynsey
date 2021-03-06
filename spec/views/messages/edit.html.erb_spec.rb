require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :email => "MyString",
      :phone => "MyString",
      :subject => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_email[name=?]", "message[email]"

      assert_select "input#message_phone[name=?]", "message[phone]"

      assert_select "input#message_subject[name=?]", "message[subject]"

      assert_select "input#message_content[name=?]", "message[content]"
    end
  end
end
