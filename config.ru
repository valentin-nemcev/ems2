frontend_root = File.expand_path('frontend', File.dirname(__FILE__))

require 'compass'

Compass.configuration.project_path = frontend_root
Compass.add_project_configuration

require 'sass/plugin/rack'
use Sass::Plugin::Rack

map '/' do
  run Rack::File.new(File.join(frontend_root, 'app.html'))
end

map '/stylesheets/screen.css' do
  run Rack::File.new(File.join(frontend_root, 'stylesheets/screen.css'))
end


