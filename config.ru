# encoding: utf-8

page = <<HTML.split("\n")
<html>
  <head>
    <title>Электронная РНС</title>
  </head>
  <body>
    <h1>Электронная РНС</h1>
  </body>
</html>
HTML

run ->(env) { [200, {'Content-type' => 'text/html'}, page] }
