require 'spec_helper'

describe "test_runs/index.html.haml" do
  before(:each) do
    assign(:test_runs, [
      stub_model(TestRun,
        :test_case_id => 1,
        :target_id => 1,
        :job_id => "Job"
      ),
      stub_model(TestRun,
        :test_case_id => 1,
        :target_id => 1,
        :job_id => "Job"
      )
    ])
  end

  it "renders a list of test_runs" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Job".to_s, :count => 2)
  end
end
