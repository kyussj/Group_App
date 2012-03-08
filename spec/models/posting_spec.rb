require 'spec_helper'

describe Posting do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # WARNING!! This code is wrong!
    @posting = Posting.new(content: "Woot", user_id: user.id)
  end

  subject { @posting }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
end