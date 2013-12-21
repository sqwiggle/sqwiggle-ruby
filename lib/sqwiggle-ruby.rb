require 'faraday'
require 'json'
require 'virtus'

require "sqwiggle/version"

require "sqwiggle/service"
require "sqwiggle/client"
require "sqwiggle/resource"

require "sqwiggle/invite"
require "sqwiggle/message"
require "sqwiggle/user"

module Sqwiggle
  class << self
    attr_accessor :token
  end
end

