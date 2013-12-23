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
            result << self.new(item)
          end
        end
      end

      def find(id, client=Client.new)
        self.new(JSON.parse(client.get("#{endpoint}/#{id}").body))
      end

      def create(params, client=Client.new)
        self.new(JSON.parse(client.post("#{endpoint}", params).body))
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
