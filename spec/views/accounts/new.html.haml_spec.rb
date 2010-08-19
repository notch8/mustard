require 'spec_helper'

describe "accounts/new.html.haml" do
  before(:each) do
    assign(:account, stub_model(Account,
      :new_record? => true,
      :username => "MyString",
      :access_key => "MyString",
      :base_url => "MyString",
      :timeout => "",
      :host => "MyString",
      :port => "MyString"
    ))
  end

  it "renders new account form" do
    render

    rendered.should have_selector("form", :action => accounts_path, :method => "post") do |form|
      form.should have_selector("input#account_username", :name => "account[username]")
      form.should have_selector("input#account_access_key", :name => "account[access_key]")
      form.should have_selector("input#account_base_url", :name => "account[base_url]")
      form.should have_selector("input#account_timeout", :name => "account[timeout]")
      form.should have_selector("input#account_host", :name => "account[host]")
      form.should have_selector("input#account_port", :name => "account[port]")
    end
  end
end
