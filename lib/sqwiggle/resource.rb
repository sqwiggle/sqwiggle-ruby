module Sqwiggle
  class Resource

    include Virtus.model

    attribute :client, Client, default: :default_client 
    attribute :id, Integer

    def default_client
      Client.new
    end

    class << self

      attr_accessor :endpoint

      def all(client=Client.new)
        [].tap do |result|
          JSON.parse(client.get(self.endpoint).body).each do |item|
            result << self.new(item.merge client:client)
          end
        end
      end

      def find(id, client=Client.new)
        attrs = JSON.parse client.get("#{endpoint}/#{id}").body
        attrs.merge! client:client
        self.new attrs
      end

      def create(params, client=Client.new)
        attrs = JSON.parse(client.post("#{endpoint}", params).body)
        attrs.merge! client:client
        self.new attrs
      end

      def endpoint
        @endpoint || default_endpoint
      end

      def default_endpoint
        "/#{self.to_s.downcase.split('::').last}s"
      end

    end

    def update(params)
      res = client.put("#{self.class.endpoint}/#{id}", params)
      attrs = JSON.parse(res.body, :symbolize_names => true)
      self.attributes = attrs
      self
    end

    def delete
      res = client.delete("#{self.class.endpoint}/#{id}")
      res.status == 204
    end

    def save
      if(id != nil)
        update(self.attributes)
      else
        self.attributes = self.class.create(attributes, client).attributes
      end
      true
    end

  end
end
