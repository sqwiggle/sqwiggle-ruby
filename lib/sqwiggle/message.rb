module Sqwiggle
  class Message < Api::Resource

    attribute :text, String
    attribute :type, String
    attribute :author, Hash
    attribute :stream_id, Integer
    attribute :attachments, Array
    attribute :mentions, Array
    attribute :updated_at, DateTime
    attribute :created_at, DateTime
    attribute :format, String
    attribute :parse, Boolean, default:true

    def author
      if @author['type'] == 'user'
        client.users.find(@author['id'])
      elsif @author['type'] == 'client'
        client.api_clients.find(@author['id'])
      end
    end

    #TODO Deprecate
    def room_id
      self.stream_id
    end

    def room_id=(val)
      self.stream_id = val
    end

  end
end
