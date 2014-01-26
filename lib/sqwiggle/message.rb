module Sqwiggle
  class Message < Api::Resource

    attribute :text, String
    attribute :type, String
    attribute :author, Hash
    attribute :room_id, Integer
    attribute :attachments, Array
    attribute :mentions, Array
    attribute :updated_at, DateTime
    attribute :created_at, DateTime
    attribute :format, String
    attribute :parse, Boolean, default:true

    def author
      if @author[:type] == 'user'
        client.users.find(@author[:id])
      elsif @author[:type] == 'client'
        client.api_clients.find(@author[:id])
      end
    end

  end
end
