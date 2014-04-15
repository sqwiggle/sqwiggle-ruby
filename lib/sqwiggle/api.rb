module Sqwiggle
  module Api
    #for testing/development purposes
    def self.url
      @@url ||= 'https://api.sqwiggle.com/'
    end

    def self.url=(val)
      @@url = val
    end
  end
end
