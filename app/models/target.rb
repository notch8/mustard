class Target < ActiveRecord::Base
  attr_reader :selenium_driver
  alias :page :selenium_driver
  
  has_many :test_runs
  has_many :test_targets
  
  def name
    "#{os}:#{browser}:#{browser_version}"
  end
  
  
end
