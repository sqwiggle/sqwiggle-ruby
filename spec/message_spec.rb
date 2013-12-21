require 'spec_helper'

describe Sqwiggle::Message do

  before do
    Sqwiggle.token = 'some_token'
  end

  describe "initialization" do
    it "accepts a hash" do
      m = Sqwiggle::Message.new({text:'some text'})
      m.text.should be == 'some text'
    end

    it "ignores extraneous values hash" do
      m = Sqwiggle::Message.new({text:'some text', extraneous:1})
      m.text.should be == 'some text'
    end
  end
end
