require 'spec_helper'

describe "accounts/index.html.haml" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :username => "Username",
        :access_key => "Access Key",
        :base_url => "Base Url",
        :timeout => "",
        :host => "Host",
        :port => "Port"
      ),
      stub_model(Account,
        :username => "Username",
        :access_key => "Access Key",
        :base_url => "Base Url",
        :timeout => "",
        :host => "Host",
        :port => "Port"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    rendered.should have_selector("tr>td", :content => "Username".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Access Key".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Base Url".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Host".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Port".to_s, :count => 2)
  end
end
