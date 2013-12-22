require 'spec_helper'

describe "api error handling" do

  context "400" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 400, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::BadRequestError)
    end

  end

  context "401" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 401, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::AuthenticationError)
    end
  end

  context "402" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 402, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::PaymentRequiredError)
    end
  end

  context "403" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 403, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::AuthorizationError)
    end
  end

  context "404" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 404, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::NotFoundError)
    end
  end

  context "500" do
    before do
      Sqwiggle.token = 'token'

      stub_request(:get, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "[]", 
        :status => 500, 
        :headers => { 'Content-Length' => 3 }
      })
    end

    it "raises an exception" do
      expect{Sqwiggle::Message.all}.to raise_error(Sqwiggle::Errors::ServerError)
    end
  end

end
