class TestCase < ActiveRecord::Base
  belongs_to :user
  attr_accessor :selenium_driver, :test_target_set
  alias_method :page, :selenium_driver
  
  belongs_to :account
  has_many :test_runs

  has_many :test_targets
  has_many :targets, :through => :test_targets
  
  def test_target_set=(value)
    self.test_targets.destroy_all
    value.each do |target_id|
      self.test_targets.build(:target_id => target_id)
    end
  end
  
  def test_target_set
    self.targets.collect do |target| target.id end
  end

  def run
    self.targets.each do |target|
      begin
        setup(target)
        self.content.each_line do |cont|
          eval(cont)
        end
        self.test_runs.create!(:job_id => page.session_id, :target => target)
      rescue Exception => e
        logger.error "============== test case: #{self.id} target: #{target.id} had an error\n#{e.message}\n#{e.backtrace}"
        raise e
      ensure
        self.selenium_driver.close_current_browser_session if self.selenium_driver
      end
    end
  end
  
  def setup(target)
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new(
      :host => self.account.host,
      :port => self.account.port, 
      :browser => '{"username": "' + self.account.username + '",' +
                    '"access-key": "' + self.account.access_key + '",' +
                    '"os": "' + target.os + '",' +
                    '"browser": "' + target.browser + '",' +
                    '"browser-version": "' + target.browser_version + '",' +
                    '"job-name": "' + self.name + '"}',
      :url => self.account.base_url,
      :timeout_in_second => self.account.timeout)
      
    @selenium_driver.start_new_browser_session
  end
  
end
