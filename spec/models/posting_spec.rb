require 'spec_helper'

describe Posting do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @posting = Posting.new(content: "Bob is ace", user_id: user.id)
  end

  subject { @posting }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @posting.user_id = nil }
    it { should_not be_valid }
  end
end