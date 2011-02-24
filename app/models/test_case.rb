class TestCase < ActiveRecord::Base
  belongs_to :user
  attr_accessor :selenium_driver, :test_target_set
  alias_method :page, :selenium_driver
  
  belongs_to :account
  has_many :test_runs

  has_many :test_targets
  has_many :targets, :through => :test_targets
  
  def self.run_frequencies
    [["on demand", ""], ["10 minutes", "600"], ["1 hour", "3600"], ["5 hours", "18000"], ["1 day", "86400"], ["1 week", "604800"]]
  end

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
        # self.content.each_line do |cont|
          self.instance_eval(self.content)
        # end
        self.test_runs.create!(:job_id => page.session_id, :target => target)
        UserMailer.deliver_success(self)
      rescue Exception => e
        Exceptional.handle(e)
        logger.error "============== test case: #{self.id} target: #{target.id} had an error\n#{e.message}\n#{e.backtrace}"
        self.test_runs.create!(:job_id => page.session_id, :target => target, :error => "#{e.message}\n\n#{e.backtrace}")
        UserMailer.deliver_failure(self)
      ensure
        self.selenium_driver.close_current_browser_session if self.selenium_driver
        self.delay(:run_at => self.run_frequency.to_i.from_now).run unless self.run_frequency.blank?
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
