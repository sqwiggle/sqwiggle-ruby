module Sqwiggle
  class Invite < Resource
    self.endpoint = '/invites'
    attribute :email, String
  end
end
