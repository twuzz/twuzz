require 'spec_helper'

describe RegistrationController do
  describe 'new' do
    before { get :new }
    context 'response' do
      subject { response }
      it { should be_successful }
      it { should render_template('new') }
    end
    context '@user' do
      subject { assigns :user }
      it { should be_a(User) }
      it { should be_new_record }
    end
  end

  describe 'create' do
    context 'with valid email, password, password_confirmation, first_name, and last_name' do
      let(:email)                 { 'oscar@imoscar.com' }
      let(:password)              { 'brownie' }
      let(:password_confirmation) { 'brownie' }
      let(:first_name)            { 'Oscar' }
      let(:last_name)             { 'Bluth' }
      before { post :create, user: { email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name } }
      context 'response' do
        subject { response }
        it { should redirect_to('/') }
      end
      context 'session' do
        subject { session }
        its([ 'user_id' ]) { should == assigns(:user).id }
      end
      context '@user' do
        subject { assigns :user }
        it { should be_a(User) }
        it { should_not be_new_record }
        its(:email) { should == email }
        it('authenticate with email should return nil') { assigns(:user).authenticate(email).should be_false }
        it('authenticate with password should return @user') { assigns(:user).authenticate(password).should == assigns(:user) }
        it('authenticate with password_confirmation should return @user') { assigns(:user).authenticate(password_confirmation).should == assigns(:user) }
        its(:first_name) { should == first_name }
        its(:last_name) { should == last_name }
      end
    end

    context 'with no parameters' do
      before { post :create }
      context 'response' do
        subject { response }
        it { should be_successful }
        it { should render_template('new') }
      end
      context '@exception' do
        subject { assigns :exception }
        it { should be_a(ActiveRecord::RecordInvalid) }
        its(:record) { should == assigns(:user) }
        its('record.errors.messages') { should == { password_digest: [ "can't be blank" ], email: [ "can't be blank", "is invalid" ] } }
      end
      context '@user' do
        subject { assigns :user }
        it { should be_a(User) }
        it { should be_new_record }
      end
    end
    
    context 'with invalid email' do
      let(:email) { 'oscar.com' }
      before { post :create, user: { email: email } }
      context 'response' do
        subject { response }
        it { should be_successful }
        it { should render_template('new') }
      end
      context '@exception' do
        subject { assigns :exception }
        it { should be_a(ActiveRecord::RecordInvalid) }
        its(:record) { should == assigns(:user) }
        its('record.errors.messages') { should == { password_digest: [ "can't be blank" ], email: [ "is invalid" ] } }
      end
      context '@user' do
        subject { assigns :user }
        it { should be_a(User) }
        it { should be_new_record }
        its(:email) { should == email }
      end
    end
  end
end
