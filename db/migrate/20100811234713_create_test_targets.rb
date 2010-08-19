class CreateTestTargets < ActiveRecord::Migration
  def self.up
    create_table :test_targets do |t|
      t.integer :test_case_id
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :test_targets
  end
end
