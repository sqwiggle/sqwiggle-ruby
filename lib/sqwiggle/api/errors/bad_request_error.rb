module Sqwiggle
  module Api
    module Errors
      class BadRequestError < StandardError;

        attr_reader :body

        def initialize(response)
          @body = JSON.parse response.body
        end

        def message
          {
            type:body['type'],
            param:body['param'],
            message:body['message']
          }.inspect
        end

      end
    end
  end
end

