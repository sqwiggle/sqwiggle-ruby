module Sqwiggle
  module Api
    class ErrorHandler < Faraday::Response::Middleware
      def on_complete(env)
        attrs = {}.merge JSON.parse(env[:body]) 
        return if attrs[:janus] == "success" 
        raise Error.new(attrs)
      end
    end
  end
end
