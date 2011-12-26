# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  # watch(%r{.+\.rb})
  watch(%r{frontend/(.+\.(css|js|html))$}) { |m| m[1] }
  watch(%r{frontend/[^.]+\.s[ac]ss})         { '*.css'  }
  watch(%r{frontend/(.+\.css)\.s[ac]ss})  { |m| m[1] }
  watch(%r{frontend/(.+\.js)\.coffee})    { |m| m[1] }
end
