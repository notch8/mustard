class Account < ActiveRecord::Base
  has_many :test_case
  
  belongs_to :user
end
