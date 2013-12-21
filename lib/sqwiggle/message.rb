module Sqwiggle
  class Message < Resource

    self.endpoint = '/messages'

    attribute :text, String
    attribute :type, String
    attribute :author, Hash

    def author
      #overriding logic here
    end

  end
end
