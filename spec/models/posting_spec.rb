require 'spec_helper'

describe Posting do

  let(:user) { FactoryGirl.create(:user) }
  before { @posting = user.postings.build(content: "Lorem ipsum") }

  subject { @posting }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @posting.user_id = nil }
    it { should_not be_valid }
  end
end