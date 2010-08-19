require 'spec_helper'

describe "test_targets/show.html.haml" do
  before(:each) do
    @test_target = assign(:test_target, stub_model(TestTarget,
      :test_case_id => 1,
      :target_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
