require 'spec_helper'

describe Sqwiggle::Message do

  before do
    Sqwiggle.token = 'token'
  end

  it_behaves_like "a resource"

  describe "attributes" do
    subject { described_class.new }
    it { should respond_to :room_id }
    it { should respond_to :text }
    it { should respond_to :author }
    it { should respond_to :attachments }
    it { should respond_to :mentions }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end

  subject do
    Sqwiggle::Message.new({
      id:1,
      text:'dutch coffee',
      author: {
        id:1,
        type:'user',
        name:'Some Name'
      }
    })
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
        stub_request(:get, "https://token:X@api.sqwiggle.com/users/1").to_return({
          :body => "{\"id\":1, \"name\":\"Some Name\"}"
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

  describe "#update" do
    before do
      stub_request(:put, "https://token:X@api.sqwiggle.com/messages/1").with({
        :body => { :text => 'New Name' } 
      }).to_return({
        :body => "{\"id\":1, \"text\":\"New Name\"}"
      })
    end

    it "updates the record" do
      subject.update :text => 'New Name'
      subject.text.should be == 'New Name'
    end

  end

  describe ".create" do
    before do
      stub_request(:post, "https://token:X@api.sqwiggle.com/messages").with({
        :body => { :text => 'The Name' } 
      }).to_return({
        :body => "{\"id\":1, \"text\":\"The Name\"}"
      })
    end

    it "creates the message" do
      m = Sqwiggle::Message.create :text =>'The Name'
      m.class.should be == Sqwiggle::Message 
      m.text.should be == "The Name"
    end
  end

  describe "#save" do
    context "with a new record" do
      before do
        stub_request(:post, "https://token:X@api.sqwiggle.com/messages").to_return({
          :body => "{\"id\":1, \"text\":\"The Name\"}"
        })
      end
      subject { Sqwiggle::Message.new(text:'The Name') }
      it "saves the new record" do
        subject.save.should be == true
        subject.id.should be == 1
        assert_requested :post, "https://token:X@api.sqwiggle.com/messages"
      end
    end

    context "with an existing record" do
      before do
        stub_request(:put, "https://token:X@api.sqwiggle.com/messages/1").to_return({
          :body => "{\"id\":1, \"text\":\"The Name\"}"
        })
      end
      subject { Sqwiggle::Message.new(id:1, text:'The Name') }
      it "saves the new record" do
        subject.save.should be == true
        assert_requested :put, "https://token:X@api.sqwiggle.com/messages/1"
      end
    end
  end

  describe "#delete" do
    before do
      stub_request(:post, "https://token:X@api.sqwiggle.com/messages").to_return({
        :body => "{\"id\":1, \"text\":\"The Name\"}"
      })
      subject { Sqwiggle::Message.new(id:1, text:'The Name') }
      it "saves the new record" do
        subject.delete.should be == true
        assert_requested :delete, "https://token:X@api.sqwiggle.com/messages/1"
      end
    end
  end

end
