# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :test_run do |f|
  f.test_case_id 1
  f.target_id 1
  f.job_id "MyString"
end
