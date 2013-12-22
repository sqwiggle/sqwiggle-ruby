require 'faraday'
require 'json'
require 'virtus'

require "sqwiggle/version"

require "sqwiggle/error_handler"
require "sqwiggle/service"
require "sqwiggle/client"
require "sqwiggle/resource"

require "sqwiggle/errors/authentication_error"
require "sqwiggle/errors/authorization_error"
require "sqwiggle/errors/bad_request_error"
require "sqwiggle/errors/not_found_error"
require "sqwiggle/errors/payment_required_error"
require "sqwiggle/errors/server_error"

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

