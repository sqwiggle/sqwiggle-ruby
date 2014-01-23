module Sqwiggle
  class Error < StandardError

    attr_reader :status
    attr_reader :error_type
    attr_reader :param

    def initialize(response)
      h = JSON.parse(response.body)
      @status = response.status
      @type = h['type']
      @param = h['param']
      super(message)
    end

  end
end
