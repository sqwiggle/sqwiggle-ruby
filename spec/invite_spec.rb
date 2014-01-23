require "spec_helper"

describe Sqwiggle::Invite do
  it_behaves_like "a resource"
  subject { described_class.new }
  it { should respond_to :from_id }
  it { should respond_to :email }
  it { should respond_to :avatar }
  it { should respond_to :url }
  it { should respond_to :created_at }
end



