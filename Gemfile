source 'http://rubygems.org'

gem 'rails', '~> 3.0.0'

gem "compass", ">= 0.10.4"
gem "compass-jquery-ui", :git => "git://github.com/fordguo/compass-jquery-ui.git"
gem "database_cleaner", ">=0.5.0", :group => :cucumber
gem "delayed_job", :git => "git://github.com/collectiveidea/delayed_job.git"
gem "devise", ">=1.1.rc2"
gem "exceptional"
gem "factory_girl_rails"
gem "fancy-buttons"
gem "formtastic", :git => "git://github.com/justinfrench/formtastic.git", :branch => "1.1-stable"
gem "friendly_id", ">= 3.0" # SEO Friendly URLs
gem "haml-rails", ">= 0.2"
gem "heroku"
gem "inherited_resources", ">=1.1.2"
gem "rails3-generators", :git => "git://github.com/indirect/rails3-generators.git"
gem "random_data" # We use this in the seeds so we need it in all envs for now
gem "remarkable", ">=4.0.0.alpha4", :group => :test
gem "remarkable_activemodel", ">=4.0.0.alpha4", :group => :test
gem "remarkable_activerecord", ">=4.0.0.alpha4", :group => :test
gem "rspec", ">=2.0.0.rc"
gem "rspec-rails", ">=2.0.0.rc"
gem "selenium-client", :require => "selenium/client"
gem "shoulda", ">= 2.11.3"
gem "sqlite3-ruby", ">=1.3.1", :require => "sqlite3"
gem "taps"
gem "will_paginate","~> 3.0.pre2"

group :production do
  gem 'pg'
end

group :development, :test do
  gem "annotate-models"
  gem "growl"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "heroku_san"
  gem "rb-fsevent"
  gem "ruby-debug", :platforms => [:ruby_18]
  gem "ruby-debug19", :platforms => [:ruby_19]
end
