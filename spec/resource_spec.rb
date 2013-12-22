require 'spec_helper'

describe Sqwiggle::Resource do
  
  let(:client) { double('mock_client') }
  let(:response) { double('faraday_response') }

  before do
    client.stub(:get).and_return(response)
    Sqwiggle.token = 'some client'
  end

  describe ".all" do
    it "calls the index endpoint" do
      response.stub(:body).and_return("[{\"a\":1,\"b\":2}]")
      client.should_receive(:get).with('/resources')
      Sqwiggle::Resource.all(client)
    end
  end

  describe ".all" do
    it "calls the index endpoint" do
      response.stub(:body).and_return("{\"a\":1,\"b\":2}")
      client.should_receive(:get).with('/resources/1')
      Sqwiggle::Resource.find(1, client)
    end
  end

end
