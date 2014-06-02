require 'spec_helper'

describe Sqwiggle::ContactRequest do
  it_behaves_like "a resource"
  subject { described_class.new }
  it { should respond_to :state }
  it { should respond_to :user_id }
  it { should respond_to :contact_id }

  describe "#approve!" do
    subject { Sqwiggle::ContactRequest.new(id:1, state:'requested') }

    context "with a valid request" do
      before do
        Sqwiggle.stub(:token).and_return 'token'
        stub_request(:put, "https://token:X@api.sqwiggle.com/contact_requests/1/approve").to_return({
          :body => { id:1, state:'approved', user_id:1, contact_id:1, created_at:Time.now }.to_json,
          :status => 200, 
          :headers => { 'Content-Length' => 3 }
        })
      end

      it "updates its state" do
        expect{ subject.approve! }.to change{ subject.state }.from('requested').to('approved')
      end
    end

    context "with an invalid request" do
      before do
        Sqwiggle.stub(:token).and_return 'token'
        stub_request(:put, "https://token:X@api.sqwiggle.com/contact_requests/1/approve").to_return({
          :body => { message:'invalid request' }.to_json,
          :status => 400, 
          :headers => { 'Content-Length' => 3 }
        })
      end
      it "raises an error" do
        expect{ subject.approve! }.to raise_error(Sqwiggle::Api::Errors::BadRequestError)
      end
    end
  end

  describe "#approve" do
    subject { Sqwiggle::ContactRequest.new(id:1, state:'requested') }

    context "with a valid request" do

      before do
        Sqwiggle.stub(:token).and_return 'token'
        stub_request(:put, "https://token:X@api.sqwiggle.com/contact_requests/1/approve").to_return({
          :body => { id:1, state:'approved', user_id:1, contact_id:1, created_at:Time.now }.to_json,
          :status => 200, 
          :headers => { 'Content-Length' => 3 }
        })
      end

      it "updates its state" do
        expect{ subject.approve }.to change{ subject.state }.from('requested').to('approved')
      end

    end

    context "with an invalid request" do
      before do
        Sqwiggle.stub(:token).and_return 'token'
        stub_request(:put, "https://token:X@api.sqwiggle.com/contact_requests/1/approve").to_return({
          :body => { message:'invalid request' }.to_json,
          :status => 400, 
          :headers => { 'Content-Length' => 3 }
        })
      end
      it "does not raise an error" do
        subject.approve.should be_false
      end
    end

  end
end
