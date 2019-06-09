# encoding: utf-8

require 'pry'
require 'json'

module EMS
  class Backend

    def toplevel_resources
      [
        {
          name: 'Учителя',
          link: '/teachers',
        },
        {
          name: 'Группы',
          link: '/groups'
        }
      ]
    end

    def teachers_resource
      [
        {name: 'Teacher 1'},
        {name: 'Teacher 2'},
        {name: 'Teacher 3'},
      ]
    end

    def call(env)
      req = Rack::Request.new(env)
      if req.path_info == ''
        resp = JSON.generate(toplevel_resources)
      elsif req.path_info == '/teachers'
        resp = JSON.generate(teachers_resource)
      else
        resp = JSON.generate({})
      end

      [200, {'Content-Type' => 'application/json'}, resp.lines]
    end

  end
end
