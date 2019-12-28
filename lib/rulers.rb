require "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      return [404, {'Content-Type' => 'text/html'}, []] unless env["PATH_INFO"] != '/favicon.ico'n
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
      [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
