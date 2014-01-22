require 'faraday'
require 'json'
require 'virtus'

require "sqwiggle/version"

require "sqwiggle/api/error_handler"
require "sqwiggle/api/service"
require "sqwiggle/api/client"
require "sqwiggle/api/resource"
require "sqwiggle/api/errors/authentication_error"
require "sqwiggle/api/errors/authorization_error"
require "sqwiggle/api/errors/bad_request_error"
require "sqwiggle/api/errors/not_found_error"
require "sqwiggle/api/errors/payment_required_error"
require "sqwiggle/api/errors/server_error"

require "sqwiggle/invite"
require "sqwiggle/message"
require "sqwiggle/user"
require "sqwiggle/notification"
require "sqwiggle/api_client"

module Sqwiggle
  class << self
    attr_accessor :token
  end
end

