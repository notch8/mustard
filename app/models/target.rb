class Target < ActiveRecord::Base
  attr_reader :selenium_driver
  alias :page :selenium_driver
  
  has_many :test_runs, :dependent => :destroy
  has_many :test_targets, :dependent => :destroy
  
  def name
    "#{os}:#{browser}:#{browser_version}"
  end
  
  
end
