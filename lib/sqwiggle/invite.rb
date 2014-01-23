module Sqwiggle
  class Invite < Api::Resource
    attribute :email, String
    attribute :created_at, DateTime
    attribute :url, String
    attribute :from_id, Integer
    attribute :avatar, String
  end
end
