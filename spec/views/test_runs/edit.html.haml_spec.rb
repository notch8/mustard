require 'spec_helper'

describe "test_runs/edit.html.haml" do
  before(:each) do
    @test_run = assign(:test_run, stub_model(TestRun,
      :new_record? => false,
      :test_case_id => 1,
      :target_id => 1,
      :job_id => "MyString"
    ))
  end

  it "renders the edit test_run form" do
    render

    rendered.should have_selector("form", :action => test_run_path(@test_run), :method => "post") do |form|
      form.should have_selector("input#test_run_test_case_id", :name => "test_run[test_case_id]")
      form.should have_selector("input#test_run_target_id", :name => "test_run[target_id]")
      form.should have_selector("input#test_run_job_id", :name => "test_run[job_id]")
    end
  end
end
