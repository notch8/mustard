# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :test_case do |f|
  f.account_id 1
  f.name "MyString"
  f.content "MyText"
end
