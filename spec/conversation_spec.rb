require "spec_helper"

describe Sqwiggle::Conversation do
  it_behaves_like "a resource"
  subject { described_class.new }
  it { should respond_to :participating }
  it { should respond_to :participated }
  it { should respond_to :status }
  it { should respond_to :room_id }
  it { should respond_to :created_at }
end



