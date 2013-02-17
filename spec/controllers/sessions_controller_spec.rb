require 'spec_helper'

describe SessionsController do
  describe 'new' do
    before { get :new }
    context 'response' do
      subject { response }
      it { should be_successful }
      it { should render_template('new') }
    end
  end

  describe 'create' do
    context 'with params[:user][:email] for User' do
      let(:password) { 'babybuster' }
      let(:user) { FactoryGirl.create :user, password: password }
      context 'with params[:user][:password] matching User\'s' do
        before { post :create, user: { email: user.email, password: password } }
        describe 'response' do
          subject { response }
          it { should redirect_to('/') }
        end
        describe 'session' do
          subject { session }
          its([ :user_id ]) { should == user.id }
        end
      end
      context 'with params[:user][:password] not matching User\'s' do
        before { post :create, user: { email: user.email, password: 'wrong' } }
        describe 'response' do
          subject { response }
          it { should be_success }
          it { should render_template('new') }
        end
      end
    end
    context 'with params[:user][:email] for User that does not exist' do
      before { post :create, user: { email: 'email', password: 'wrong' } }
      describe 'response' do
        subject { response }
        it { should be_success }
        it { should render_template('new') }
      end
    end
  end

  describe 'destroy' do
    describe 'response' do
      before { get :destroy }
      subject { response }
      it { should redirect_to('/') }
    end
    describe 'session' do
      it('should be reset') do
        controller.should_receive(:reset_session)
        get :destroy
      end
    end
  end
end
