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

    end
  end
end
