require 'spec_helper'

describe Sqwiggle::Api::Errors::BadRequestError do
  let(:response) { double('response') }

  subject { described_class.new({"type"=>"validation","message"=>"invalid request","param"=>"name"}) }

  specify { subject.type.should be == "validation" }
  specify { subject.message.should be == "invalid request" }
  specify { subject.param.should be == "name" }

end
