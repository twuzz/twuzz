require 'spec_helper'

describe User do
  describe 'attributes' do
    let(:user) { FactoryGirl.create :user }
    subject { user }
    it { should have_db_column(:id).of_type(:integer).with_options(:null => false) }
    it { should have_db_column(:email).of_type(:string).with_options(:null => false) }
    it { should have_db_column(:password_digest).of_type(:string).with_options(:null => false, :limit => 60) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_index(:email).unique(true) }
    it { should have_many(:photos) }
    it { should have_many(:datastores) }
    #it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test.example.com').for(:email) }
  end

  describe 'instance method' do
    let(:user) { FactoryGirl.build :user }

    describe 'to_s' do
      subject { user.to_s }
      context 'first_name and last_name are blank' do
        before do
          user.first_name = nil
          user.last_name = nil
        end
        it { should == user.email }
      end
      context 'first_name is blank and last_name is set' do
        before do
          user.first_name = nil
        end
        it { should == user.last_name }
      end
      context 'first_name is set and last_name is blank' do
        before do
          user.last_name = nil
        end
        it { should == user.first_name }
      end
      context 'first_name is set and last_name is set' do
        before do
        end
        it { should == "#{user.first_name} #{user.last_name}" }
      end
    end
  end
end
