module Sqwiggle
  module Api
    class ErrorHandler < Faraday::Response::Middleware
      def on_complete(env)
        raise Errors::BadRequestError.new(env)        if env[:status] == 400
        raise Errors::AuthenticationError.new(env)    if env[:status] == 401
        raise Errors::PaymentRequiredError.new(env)   if env[:status] == 402
        raise Errors::AuthorizationError.new(env)     if env[:status] == 403
        raise Errors::NotFoundError.new(env)          if env[:status] == 404
        raise Errors::ServerError.new(env)            if env[:status] == 500
      end
    end
  end
end
