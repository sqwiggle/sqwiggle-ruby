module Sqwiggle
  class Notification < Api::Resource
    attribute :login, String
    attribute :logout, String
    attribute :workroom_enter, String
    attribute :workroom_leave, String
    attribute :conversation_enter, String
    attribute :conversation_leave, String
    attribute :stream_item, String
    attribute :stream_item_in_conversation, String
    attribute :mention, String
    attribute :sqwiggle_news_updates, String
    attribute :sqwiggle_tips, String
    attribute :onboard_invite, String
    attribute :onboard_busy, String
    attribute :onboard_conversation_start, String
    attribute :onboard_conversation_leave, String
    attribute :onboard_mentions, String
    attribute :onboard_notifications, String
    attribute :onboard_chrome_access, String
    attribute :onboard_invited, String
  end
end
