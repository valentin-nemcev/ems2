#\ --port 8081 --host 0.0.0.0

require 'bundler'
Bundler.setup(:default)

require File.expand_path('frontend/frontend', File.dirname(__FILE__))

use Rack::ShowStatus
use Rack::Reloader

run EMS::Frontend.new

