require 'tilt'
require 'pathname'
module EMS
  class Frontend
    attr_accessor :frontend_root
    def initialize
      @frontend_root = Pathname.new(__FILE__).dirname

      require 'compass'

      Compass.configuration.project_path = frontend_root
      Compass.add_project_configuration
      @tpl_opts = {
        'sass' => Compass.sass_engine_options,
      }
    end

    def call(env)
      req = Rack::Request.new(env)
      req.path_info += 'app.html' if req.path_info == '/'

      req_path = Pathname.new(req.path_info).cleanpath.sub(%r{^/}, '')
      tpl_glob = "#{frontend_root + req_path}*"
      tpl_path = Pathname.glob(tpl_glob)[0]

      return [404, {}, []] if tpl_path.nil? || !tpl_path.file?

      tpl_ext = tpl_path.basename.to_s
                      .sub(req_path.basename.to_s, '').sub('.', '')

      resp = if Tilt.registered?(tpl_ext)
               Tilt.new(tpl_path.to_s, @tpl_opts[tpl_ext]).render
             else
               tpl_path
             end

      content_type = Rack::Mime.mime_type(req_path.extname, 'text/plain')
      [200, {'Content-Type' => content_type}, resp.each_line]
    end
  end
end
