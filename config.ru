#\ --port 9292 --host 0.0.0.0
# use Sass::Plugin::Rack
require 'rubygems'
require 'bundler'
Bundler.setup(:default)

require File.expand_path('frontend/frontend', File.dirname(__FILE__))

use Rack::ShowStatus

run EMS::Frontend.new
# map '/' do
  # run Rack::File.new(File.join(frontend_root, 'app.html'))
# end

# map '/stylesheets/screen.css' do
  # run Rack::File.new(File.join(frontend_root, 'stylesheets/screen.css'))
# end


