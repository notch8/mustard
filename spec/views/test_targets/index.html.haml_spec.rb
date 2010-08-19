require 'spec_helper'

describe "test_targets/index.html.haml" do
  before(:each) do
    assign(:test_targets, [
      stub_model(TestTarget,
        :test_case_id => 1,
        :target_id => 1
      ),
      stub_model(TestTarget,
        :test_case_id => 1,
        :target_id => 1
      )
    ])
  end

  it "renders a list of test_targets" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
