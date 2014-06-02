module Sqwiggle
  module Api
    module Errors
      class Base < StandardError
        include Virtus.model
        attribute :message, String 
        attribute :details, String
        attribute :param, String
        attribute :type, String
      end
    end
  end
end
