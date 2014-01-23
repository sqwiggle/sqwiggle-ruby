require "spec_helper"

describe Sqwiggle::Room do
  it_behaves_like "a resource"
  subject { described_class.new }
  it { should respond_to :path }
  it { should respond_to :name }
  it { should respond_to :user_count }
  it { should respond_to :created_at }
end


