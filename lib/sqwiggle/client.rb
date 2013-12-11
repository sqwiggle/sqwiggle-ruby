module Sqwiggle
  class Client

    def connection
      @connection ||= Faraday.new(url:url) do |f|
        f.request  :url_encoded             # form-encode POST params
        f.response :logger                  # log requests to STDOUT
        f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    private

    def url
      'localhost:3001'
    end

  end
end
