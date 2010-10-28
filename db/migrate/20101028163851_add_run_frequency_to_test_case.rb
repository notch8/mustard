class AddRunFrequencyToTestCase < ActiveRecord::Migration
  def self.up
    add_column :test_cases, :run_frequency, :string
  end

  def self.down
    remove_column :test_cases, :run_frequency
  end
end
