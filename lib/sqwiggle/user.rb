module Sqwiggle
  class User < Api::Resource
    self.endpoint = '/users'
    attribute :role, String
    attribute :status, String
    attribute :confirmed, Boolean
    attribute :message, String
    attribute :email, String
    attribute :name, String
    attribute :avatar, String
    attribute :time_zone, String
    attribute :is_contact, Boolean
    attribute :contact, Hash
    attribute :time_zone_offset, Float
    attribute :snapshot, String
    attribute :snapshot_interval, Integer
    attribute :last_connected_at, DateTime
    attribute :last_active_at, DateTime
    attribute :created_at, DateTime
    attribute :media_device_id, String
    attribute :idle_at, DateTime
  end
end
