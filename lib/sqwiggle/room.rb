module Sqwiggle
  class Room < Api::Resource
    attribute :name, String
    attribute :path, String
    attribute :user_count, Integer
    attribute :created_at, DateTime
  end
end
