require 'spec_helper'

describe "test_cases/edit.html.haml" do
  before(:each) do
    @test_case = assign(:test_case, stub_model(TestCase,
      :new_record? => false,
      :account_id => 1,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit test_case form" do
    render

    rendered.should have_selector("form", :action => test_case_path(@test_case), :method => "post") do |form|
      form.should have_selector("input#test_case_account_id", :name => "test_case[account_id]")
      form.should have_selector("input#test_case_name", :name => "test_case[name]")
      form.should have_selector("textarea#test_case_content", :name => "test_case[content]")
    end
  end
end
