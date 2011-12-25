# encoding: utf-8
require 'capybara/cucumber'

page = <<HTML
<html>
  <head>
    <title>Электронная РНС</title>
  </head>
  <body>
    <h1>Электронная РНС</h1>
  </body>
</html>
HTML

Capybara.app = ->(env) { [200, {'Content-type' => 'text/html'}, page] }
