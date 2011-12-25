frontend_root = File.expand_path('frontend', File.dirname(__FILE__))

run Rack::File.new(File.join(frontend_root, 'app.html'))


