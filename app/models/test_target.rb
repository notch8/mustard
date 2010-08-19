class TestTarget < ActiveRecord::Base
  belongs_to :test_case
  belongs_to :target
end
