module Sqwiggle
  class User < Resource
    self.endpoint = '/users'
    attribute :name, String
    attribute :role, String
    attribute :media, String
    attribute :status, String
    attribute :message, String
    attribute :email, String
    attribute :confirmed, Boolean
    attribute :time_zone, String
    attribute :time_zone_offset, Float
    attribute :created_at, DateTime
    attribute :last_connected_at, DateTime
    attribute :last_active_at, DateTime
    attribute :last_still, String
    attribute :avatar, String
  end
end
