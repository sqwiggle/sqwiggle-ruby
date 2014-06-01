module Sqwiggle
  class ContactRequest < Api::Resource
    self.endpoint = '/contact_requests'
    attribute :user_id, Integer
    attribute :contact_id, Integer
    attribute :state, String

    class << self
      def sent(client=Client.new)
        client.get "#{endpoint}/sent"
      end

      def received(client=Client.new)
        client.get "#{endpoint}/received"
      end

      def open(client=Client.new)
        client.get "#{endpoint}/open"
      end
    end

    def approve
      res = client.put("#{self.class.endpoint}/#{id}/approve", {})
      attrs = JSON.parse(res.body, :symbolize_names => true)
      self.attributes = attrs
      self
    end

    def ignore
      res = client.put("#{self.class.endpoint}/#{id}/ignore", {})
      attrs = JSON.parse(res.body, :symbolize_names => true)
      self.attributes = attrs
      self
    end

    def cancel
      res = client.put("#{self.class.endpoint}/#{id}/cancel", {})
      attrs = JSON.parse(res.body, :symbolize_names => true)
      self.attributes = attrs
      self
    end
  end
end
