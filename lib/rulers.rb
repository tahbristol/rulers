require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    def call(env)
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
