require 'spec_helper'

describe "targets/index.html.haml" do
  before(:each) do
    assign(:targets, [
      stub_model(Target,
        :os => "Os",
        :browser => "Browser",
        :browser_version => "Browser Version"
      ),
      stub_model(Target,
        :os => "Os",
        :browser => "Browser",
        :browser_version => "Browser Version"
      )
    ])
  end

  it "renders a list of targets" do
    render
    rendered.should have_selector("tr>td", :content => "Os".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Browser".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Browser Version".to_s, :count => 2)
  end
end
