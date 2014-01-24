require 'spec_helper'

describe Sqwiggle::Api::Client do


  describe ".new" do
    before do
      Sqwiggle.token = nil
    end
    context "with a globally specified token" do
      before do
        Sqwiggle.token = 'global_token'
      end
      context "without specifying a token in the initializer" do
        subject { Sqwiggle::Api::Client.new }
        its(:token) { should be == 'global_token' }
      end
      context "with specifying a token in the initializer" do
        subject { Sqwiggle::Api::Client.new 'local_token' }
        its(:token) { should be == 'local_token' }
      end
    end
    context "without a globally specified token" do
      it "Raises an error" do
        expect { Sqwiggle::Api::Client.new }.to raise_error(Sqwiggle::Api::Client::NoTokenError)
      end
    end
  end

  describe 'services' do
    before do
      Sqwiggle.token = '12345'
    end
    it { should respond_to :messages }
    it { should respond_to :users }
    it { should respond_to :conversations }
    it { should respond_to :rooms }
    it { should respond_to :invites }
    it { should respond_to :api_clients }
  end

  describe "#get" do
    subject { Sqwiggle::Api::Client.new 'local_token' }
    let(:endpoint) { '/users/1' }

    it "delegates to Faraday" do
      Faraday::Connection.any_instance.should_receive(:get).with(endpoint, {})
      subject.get endpoint
    end
  end

end
