require 'faraday'
require 'json'
require 'virtus'

module Sqwiggle
  module Api
    require "sqwiggle/api"
    require "sqwiggle/api/error_handler"
    require "sqwiggle/api/service"
    require "sqwiggle/api/client"
    require "sqwiggle/api/resource"

    require "sqwiggle/api/errors/base"
    require "sqwiggle/api/errors/authentication_error"
    require "sqwiggle/api/errors/authorization_error"
    require "sqwiggle/api/errors/bad_request_error"
    require "sqwiggle/api/errors/not_found_error"
    require "sqwiggle/api/errors/payment_required_error"
    require "sqwiggle/api/errors/server_error"

    require "sqwiggle/api_client"
    require "sqwiggle/contact_request"
    require "sqwiggle/invite"
    require "sqwiggle/message"
    require "sqwiggle/conversation"
    require "sqwiggle/user"
    require "sqwiggle/room"
    require "sqwiggle/notification"
    require "sqwiggle/version"
  end

  class << self
    attr_accessor :token
    def client(t=nil)
      Api::Client.new (t || Sqwiggle.token)
    end
  end

end

