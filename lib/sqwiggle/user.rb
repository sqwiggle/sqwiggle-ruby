module Sqwiggle
  class User < Resource
    self.endpoint = '/users'
    attribute :name
  end
end
