require 'spec_helper'

describe Sqwiggle::Client do


  describe ".new" do
    before do
      Sqwiggle.token = nil
    end
    context "with a globally specified token" do
      before do
        Sqwiggle.token = 'global_token'
      end
      context "without specifying a token in the initializer" do
        subject { Sqwiggle::Client.new }
        its(:token) { should be == 'global_token' }
      end
      context "with specifying a token in the initializer" do
        subject { Sqwiggle::Client.new 'local_token' }
        its(:token) { should be == 'local_token' }
      end
    end
    context "without a globally specified token" do
      it "Raises an error" do
        expect { Sqwiggle::Client.new }.to raise_error(Sqwiggle::Client::NoTokenError)
      end
    end
  end

  describe "#get" do
    subject { Sqwiggle::Client.new 'local_token' }
    let(:endpoint) { '/users/1' }

    it "delegates to Faraday" do
      Faraday::Connection.any_instance.should_receive(:get).with(endpoint, {})
      subject.get endpoint
    end
  end

end
