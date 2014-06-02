require 'spec_helper'

describe Sqwiggle::Api::ErrorHandler do
  subject { described_class.new }
  let(:response_env) { double("Response env") }
  before do
    response_env.stub(:[]).with(:body).and_return({
      message:'1',
      details:'2',
      param:'3'
    }.to_json)
  end

  describe "#on_complete" do
    context "with a bad request" do
      before do
        response_env.stub(:[]).with(:status).and_return(400)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::BadRequestError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
    context "with an authentication error" do
      before do
        response_env.stub(:[]).with(:status).and_return(401)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::AuthenticationError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
    context "with a payment required error" do
      before do
        response_env.stub(:[]).with(:status).and_return(402)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::PaymentRequiredError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
    context "with an authorization error" do
      before do
        response_env.stub(:[]).with(:status).and_return(403)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::AuthorizationError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
    context "with a not found error" do
      before do
        response_env.stub(:[]).with(:status).and_return(404)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::NotFoundError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
    context "with a server error" do
      before do
        response_env.stub(:[]).with(:status).and_return(500)
      end
      it "raises a bad request error" do 
        lambda { subject.on_complete(response_env) }.should raise_exception(Sqwiggle::Api::Errors::ServerError) { |exception| 
          exception.message.should be == '1'
          exception.details.should be == '2'
          exception.param.should be == '3'
        }
      end
    end
  end
end
