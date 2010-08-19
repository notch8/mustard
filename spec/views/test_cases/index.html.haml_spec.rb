require 'spec_helper'

describe "test_cases/index.html.haml" do
  before(:each) do
    assign(:test_cases, [
      stub_model(TestCase,
        :account_id => 1,
        :name => "Name",
        :content => "MyText"
      ),
      stub_model(TestCase,
        :account_id => 1,
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of test_cases" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
