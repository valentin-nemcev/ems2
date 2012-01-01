#\ --port 8081 --host 0.0.0.0

require 'bundler'
Bundler.setup(:default)

require File.expand_path('frontend/frontend', File.dirname(__FILE__))
require File.expand_path('backend/backend', File.dirname(__FILE__))

use Rack::ShowStatus
use Rack::Reloader

map '/resources' do
  run EMS::Backend.new
end

map '/' do
  run EMS::Frontend.new
end


