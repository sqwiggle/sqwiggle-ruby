shared_examples_for "a resource" do
  subject { described_class.new }
  specify { subject.should respond_to :id }
  specify { subject.client.should be == Sqwiggle::Api::Client.new }
  specify { described_class.should respond_to :find }
  specify { described_class.should respond_to :create }
end

