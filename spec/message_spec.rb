require 'spec_helper'

describe Sqwiggle::Message do

  it_behaves_like "a resource"

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

  describe "#author" do

    context "with a user" do

      before do
        Sqwiggle.token = 'token'
        stub_request(:get, "https://token:X@api.sqwiggle.com/users/1").to_return({
          :body => "{\"id\":1, \"name\":\"Some Name\"}"
        })
      end

      subject do
        Sqwiggle::Message.new({
          text:'dutch coffee',
          author: {
            id:1,
            type:'user',
            name:'Some Name'
          }
        })
      end
      specify { subject.author.should be_kind_of(Sqwiggle::User) }
      specify { subject.author.id.should == 1 }
    end

    context "with an api client" do
      subject do
        Sqwiggle::Message.new({
          text:'dutch coffee',
          author: {
            id:1,
            type:'client',
            name:'Github'
          }
        })
      end
      it "should return an api client"
      # specify { subject.author.should be_kind_of(Sqwiggle::ApiClient) }
      # specify { subject.author.id.should == 1 }
    end

  end
end
