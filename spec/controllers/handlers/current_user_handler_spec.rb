require 'spec_helper'

class Tester
  include CurrentUserHandler
end

describe CurrentUserHandler do
  let(:instance) { Tester.new }

  describe 'current_user' do
    subject { instance.current_user }
    context 'session[:user_id] is set to a valid User id' do
      let(:user) { FactoryGirl.create :user }
      before { instance.stub(:session).and_return({ user_id: user.id }) }
      it { should == user }
      context '@current_user' do
        subject { instance.instance_variable_get :@current_user }
        before { instance.current_user }
        it { should == user }
      end
    end
    context 'session[:user_id] is not set' do
      before { instance.stub(:session).and_return({}) }
      it { should == nil }
    end
    context 'session[:user_id] is not set to an invalid User id' do
      before { instance.stub(:session).and_return({ user_id: 1 }) }
      it { lambda{ instance.current_user }.should raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe 'require_current_user' do
    subject { instance.require_current_user }
    context 'when !!current_user' do
      let(:user) { double('User') }
      before { instance.stub(:current_user).and_return(user) }
      it { should == user }
    end
    context 'when !current_user' do
      let(:login_url) { double('login_url') }
      before do
        instance.stub(:current_user).and_return(nil)
        instance.stub(:login_url).and_return(login_url)
      end
      it('should redirect_to login_url') do
        instance.should_receive(:redirect_to).with(login_url)
        instance.require_current_user
      end
    end
  end
end
