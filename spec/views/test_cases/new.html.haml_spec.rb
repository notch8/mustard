require 'spec_helper'

describe "test_cases/new.html.haml" do
  before(:each) do
    assign(:test_case, stub_model(TestCase,
      :new_record? => true,
      :account_id => 1,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new test_case form" do
    render

    rendered.should have_selector("form", :action => test_cases_path, :method => "post") do |form|
      form.should have_selector("input#test_case_account_id", :name => "test_case[account_id]")
      form.should have_selector("input#test_case_name", :name => "test_case[name]")
      form.should have_selector("textarea#test_case_content", :name => "test_case[content]")
    end
  end
end
