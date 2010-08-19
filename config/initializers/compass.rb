require 'compass'
require 'compass/app_integration/rails'
Compass::AppIntegration::Rails.initialize!

require 'fileutils'
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

Sass::Plugin.on_updating_stylesheet do |template, css|
  puts "Compiling #{template} to #{css}"
end

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
                                             :urls => ['/stylesheets'],
                                             :root => "#{Rails.root}/tmp")

