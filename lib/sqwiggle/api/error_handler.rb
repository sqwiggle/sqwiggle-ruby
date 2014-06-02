module Sqwiggle
  module Api
    class ErrorHandler < Faraday::Response::Middleware
      def on_complete(env)
        return nil unless env[:status] >= 400
        attrs = JSON.parse(env[:body]) 
        attrs = {} if attrs.empty?
        raise Errors::BadRequestError.new(attrs)        if env[:status] == 400
        raise Errors::AuthenticationError.new(attrs)    if env[:status] == 401
        raise Errors::PaymentRequiredError.new(attrs)   if env[:status] == 402
        raise Errors::AuthorizationError.new(attrs)     if env[:status] == 403
        raise Errors::NotFoundError.new(attrs)          if env[:status] == 404
        raise Errors::ServerError.new(attrs)            if env[:status] == 500
      end
    end
  end
end
