class CreateTestCases < ActiveRecord::Migration
  def self.up
    create_table :test_cases do |t|
      t.integer :account_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :test_cases
  end
end
