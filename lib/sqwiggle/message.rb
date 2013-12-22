module Sqwiggle
  class Message < Resource

    attribute :text, String
    attribute :type, String
    attribute :author, Hash

    def author
      if @author[:type] == 'user'
        client.users.find(@author[:id])
      elsif @author[:type] == 'client'
        client.api_clients.find(@author[:id])
      end
    end

  end
end
