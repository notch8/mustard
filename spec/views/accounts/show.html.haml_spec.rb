require 'spec_helper'

describe "accounts/show.html.haml" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :username => "Username",
      :access_key => "Access Key",
      :base_url => "Base Url",
      :timeout => "",
      :host => "Host",
      :port => "Port"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Username".to_s)
    rendered.should contain("Access Key".to_s)
    rendered.should contain("Base Url".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("Host".to_s)
    rendered.should contain("Port".to_s)
  end
end
