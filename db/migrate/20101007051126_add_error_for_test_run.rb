class AddErrorForTestRun < ActiveRecord::Migration
  def self.up
    add_column :test_runs, :error, :text
  end

  def self.down
    remove_column :test_runs, :error
  end
end
