require 'spec_helper'

describe "test_runs/show.html.haml" do
  before(:each) do
    @test_run = assign(:test_run, stub_model(TestRun,
      :test_case_id => 1,
      :target_id => 1,
      :job_id => "Job"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Job".to_s)
  end
end
