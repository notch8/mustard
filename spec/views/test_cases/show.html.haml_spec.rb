require 'spec_helper'

describe "test_cases/show.html.haml" do
  before(:each) do
    @test_case = assign(:test_case, stub_model(TestCase,
      :account_id => 1,
      :name => "Name",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Name".to_s)
    rendered.should contain("MyText".to_s)
  end
end
