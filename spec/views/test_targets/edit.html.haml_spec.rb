require 'spec_helper'

describe "test_targets/edit.html.haml" do
  before(:each) do
    @test_target = assign(:test_target, stub_model(TestTarget,
      :new_record? => false,
      :test_case_id => 1,
      :target_id => 1
    ))
  end

  it "renders the edit test_target form" do
    render

    rendered.should have_selector("form", :action => test_target_path(@test_target), :method => "post") do |form|
      form.should have_selector("input#test_target_test_case_id", :name => "test_target[test_case_id]")
      form.should have_selector("input#test_target_target_id", :name => "test_target[target_id]")
    end
  end
end
