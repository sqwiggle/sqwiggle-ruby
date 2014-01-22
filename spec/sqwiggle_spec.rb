require 'spec_helper'

describe Sqwiggle do
  specify { Sqwiggle }
  specify { Sqwiggle::Api::Client }
  specify { Sqwiggle::Message }

  describe ".token=" do
    before do
      Sqwiggle.token = 'token'
    end
    specify { Sqwiggle.token.should be == 'token' }
  end
end
