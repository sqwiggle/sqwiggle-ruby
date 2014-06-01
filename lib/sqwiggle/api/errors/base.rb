module Sqwiggle
  module Api
    module Errors
      class Base < StandardError

        attr_reader :body

        def initialize(response)
          @body = JSON.parse response[:body]
        end

        def message
          body['message']
        end

      end
    end
  end
end
