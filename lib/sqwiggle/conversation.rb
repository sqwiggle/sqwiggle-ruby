module Sqwiggle
  class Conversation < Api::Resource
     attribute :room_id, Integer
     attribute :status, String
     attribute :participating, Array
     attribute :participated, Array
     attribute :created_at, DateTime
  end
end
