class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :username
      t.string :access_key
      t.string :base_url
      t.integer :timeout
      t.string :host
      t.string :port

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
