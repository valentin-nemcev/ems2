require 'pry'
require 'json'

module EMS
  class Backend

    def toplevel_resources
      [{name: 'hello'}, {name: 'another'}]
    end

    def call(env)
      req = Rack::Request.new(env)

      resp = JSON.generate(toplevel_resources)
      [200, {'Content-Type' => 'application/json'}, resp.lines]
    end

  end
end
