require 'spec_helper'

describe "targets/show.html.haml" do
  before(:each) do
    @target = assign(:target, stub_model(Target,
      :os => "Os",
      :browser => "Browser",
      :browser_version => "Browser Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Os".to_s)
    rendered.should contain("Browser".to_s)
    rendered.should contain("Browser Version".to_s)
  end
end
