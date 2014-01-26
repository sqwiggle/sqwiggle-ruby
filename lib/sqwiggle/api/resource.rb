module Sqwiggle
  module Api
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

        def create!(params, client=Client.new)
          attrs = JSON.parse(client.post("#{endpoint}", params).body)
          attrs.merge! client:client
          self.new attrs
        end

        def create(params, client=Client.new)
          create! params, client
        rescue Errors::BadRequestError 
          false
        end

        def endpoint
          @endpoint || default_endpoint
        end

        def default_endpoint
          "/#{self.to_s.downcase.split('::').last}s"
        end

      end

      def update!(params)
        res = client.put("#{self.class.endpoint}/#{id}", params)
        attrs = JSON.parse(res.body, :symbolize_names => true)
        self.attributes = attrs
        self
      end

      def update(params)
        update! params
      rescue Errors::BadRequestError 
        false
      end

      def save!
        return update!(self.attributes) if persisted?
        self.attributes = self.class.create!(attributes, client).attributes
        self
      end

      def save
        return update(self.attributes) if persisted?
        self.attributes = self.class.create(attributes, client).attributes
        self
      end

      def persisted?
        (id != nil)
      end

      def delete
        res = client.delete("#{self.class.endpoint}/#{id}")
        res.status == 204
      end

    end
  end
end
