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

    end
  end
end
