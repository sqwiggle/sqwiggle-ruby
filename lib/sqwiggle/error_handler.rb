module Sqwiggle
  class ErrorHandler < Faraday::Response::Middleware
    def on_complete(env)
      raise Errors::BadRequestError         if env[:status] == 400
      raise Errors::AuthenticationError     if env[:status] == 401
      raise Errors::PaymentRequiredError    if env[:status] == 402
      raise Errors::AuthorizationError      if env[:status] == 403
      raise Errors::NotFoundError           if env[:status] == 404
      raise Errors::ServerError             if env[:status] == 500
    end
  end
end
