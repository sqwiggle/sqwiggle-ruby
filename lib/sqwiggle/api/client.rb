module Sqwiggle
  module Api
    class Client
      class NoTokenError < StandardError;end;

      attr_accessor :token

      def initialize(token=nil)
        unless @token = token || Sqwiggle.token
          raise NoTokenError 
        end
      end

      def self.service(key, klass)
        define_method key, -> {
          instance_eval('Service').new instance_eval(klass), self
        }
      end

      service :api_clients, 'ApiClient'
      service :conversations, 'Conversation'
      service :invites, 'Invite'
      service :messages, 'Message'
      service :organization, 'Organization'
      service :users, 'User'
      service :rooms, 'Room'

      def ==(val)
        self.class == val.class && val.token == token
      end

      def get(endpoint, params={})
        connection.get endpoint, params
      end

      def put(endpoint, params)
        connection.put endpoint, params
      end

      def post(endpoint, params)
        connection.post endpoint, params
      end

      def delete(endpoint)
        connection.delete endpoint
      end

      def inspect
        #This is purely to stop huge console output when inspecting resource
        #objects as they contain a reference to the loading client
        "#<Sqwiggle::Api::Client # (#{object_id})>"
      end

      private

      def connection
        @connection ||= Faraday.new(url:Sqwiggle::Api.url) do |f|
          f.request  :url_encoded             # form-encode POST params
          f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          f.basic_auth token, 'X'
          f.headers['User-Agent'] = "sqwiggle-ruby #{Sqwiggle::VERSION}"
          f.use ErrorHandler
        end
      end

    end
  end
end
