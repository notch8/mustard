require 'spec_helper'

describe "targets/new.html.haml" do
  before(:each) do
    assign(:target, stub_model(Target,
      :new_record? => true,
      :os => "MyString",
      :browser => "MyString",
      :browser_version => "MyString"
    ))
  end

  it "renders new target form" do
    render

    rendered.should have_selector("form", :action => targets_path, :method => "post") do |form|
      form.should have_selector("input#target_os", :name => "target[os]")
      form.should have_selector("input#target_browser", :name => "target[browser]")
      form.should have_selector("input#target_browser_version", :name => "target[browser_version]")
    end
  end
end
