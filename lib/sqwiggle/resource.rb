module Sqwiggle
  class Resource
    include Virtus.model
    attribute :client, Client, default: :default_client 

    def defaul_client
      Client.new
    end
  end
end
