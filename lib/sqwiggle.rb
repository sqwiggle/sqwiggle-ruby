require 'faraday'
require "sqwiggle/version"
require "sqwiggle/client"
require "sqwiggle/resource"
require "sqwiggle/message"

module Sqwiggle
  class << self
    attr_accessor :token
  end
end

