require 'susy'

http_path       = '/'
css_dir         = 'stylesheets'
sass_dir        = 'stylesheets'
images_dir      = 'images'
javascripts_dir = 'scripts'

sass_options = {
  cache_location: Compass.projectize('../tmp/sass-cache'),
}

preferred_syntax = :sass
