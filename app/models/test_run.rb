class TestRun < ActiveRecord::Base
  belongs_to :test_case
  belongs_to :target
  
  def url
    "http://saucelabs.com/jobs/#{self.job_id}"
  end
end
