module Sqwiggle
  module Api
    class Service

      attr_reader :klass, :client

      def initialize(klass, client)
        @klass, @client = klass, client
      end

      def all
        klass.all client
      end

      def find(id)
        klass.find id, client
      end

      def new(params={})
        klass.new ({client:client}.merge(params))
      end

    end
  end
end
