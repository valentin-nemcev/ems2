require 'capybara/rspec'

require 'rack'

app, opts = *Rack::Builder.parse_file('config.ru')
Capybara.app = app
