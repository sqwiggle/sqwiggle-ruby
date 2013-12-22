module Sqwiggle
  class Client
    class NoTokenError < StandardError;end;

    attr_accessor :token
    attr_writer :url #for testing purposes

    def initialize(token=nil)
      unless @token = token || Sqwiggle.token
        raise NoTokenError 
      end
    end

    def ==(val)
      self.class == val.class && val.token == token
    end

    def get(endpoint, params={})
      connection.get endpoint, params
    end

    def messages
      Service.new Message, self
    end

    def users
      Service.new User, self
    end

    private

    def url
      @url || 'https://api.sqwiggle.com/'
    end

    def connection
      @connection ||= Faraday.new(url:url) do |f|
        f.request  :url_encoded             # form-encode POST params
        f.response :logger                  # log requests to STDOUT
        f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        f.basic_auth token, 'X'
        f.use ErrorHandler
      end
    end

  end
end
