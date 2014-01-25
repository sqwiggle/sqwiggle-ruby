require 'spec_helper'

describe Sqwiggle::Api::Errors::BadRequestError do
  let(:response) { double('response') }

  before do
    response.stub(:body) do
      '{"type":"validation","message":"invalid request","param":"name"}'
    end
  end

  subject { described_class.new response }
  specify { subject.body['type'].should be == "validation" }
  specify { subject.body['message'].should be == "invalid request" }
  specify { subject.body['param'].should be == "name" }

end
