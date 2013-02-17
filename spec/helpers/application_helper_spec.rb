require 'spec_helper'

describe ApplicationHelper do
  describe 'current_user' do
    subject { helper.current_user }
    let(:user) { double('User') }
    before do
      controller.should_receive(:current_user).and_return(user)
    end
    it { should === user }
  end
end
