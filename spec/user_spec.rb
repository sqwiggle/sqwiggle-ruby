require "spec_helper"

describe Sqwiggle::User do
  it_behaves_like "a resource"
  subject { described_class.new }
  it { should respond_to :name }
  it { should respond_to :role }
  it { should respond_to :status }
  it { should respond_to :message }
  it { should respond_to :email }
  it { should respond_to :confirmed }
  it { should respond_to :time_zone }
  it { should respond_to :time_zone_offset }
  it { should respond_to :created_at }
  it { should respond_to :last_connected_at }
  it { should respond_to :last_active_at }}
  it { should respond_to :avatar }
end
