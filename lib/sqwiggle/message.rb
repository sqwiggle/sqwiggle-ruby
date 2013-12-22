module Sqwiggle
  class Message < Resource

    attribute :text, String
    attribute :type, String
    attribute :author, Hash

    def author
      #overriding logic here
    end

  end
end
