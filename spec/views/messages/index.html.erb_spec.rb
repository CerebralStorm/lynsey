require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :email => "Email",
        :phone => "Phone",
        :subject => "Subject",
        :content => "Content"
      ),
      Message.create!(
        :email => "Email",
        :phone => "Phone",
        :subject => "Subject",
        :content => "Content"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
