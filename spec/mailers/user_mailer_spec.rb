require "spec_helper"

describe UserMailer do
  describe "failure" do
   let(:test_case) { Factory.create(:test_case) }
   let(:mail) { UserMailer.failure(test_case) }

    it "renders the headers" do
      mail.subject.should eq("[Mustard] Failure of a test run")
      mail.to.should eq(["rgkaufman@gmail.com"])
      mail.from.should eq(["mustard@notch8.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Looks like there was a failure on MyString")
    end
  end

  describe "success" do
    let(:test_case) { Factory.create(:test_case) }
    let(:mail) { UserMailer.success(test_case) }

    it "renders the headers" do
      mail.subject.should eq("[Mustard] Success of a test run")
      mail.to.should eq(["rgkaufman@gmail.com"])
      mail.from.should eq(["mustard@notch8.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Test case MyString passed")
    end
  end

end
