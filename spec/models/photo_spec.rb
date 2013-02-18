require 'spec_helper'

describe Photo do
  describe 'attributes' do
    let(:photo) { FactoryGirl.create :photo }
    subject { photo }
    it { should have_db_column(:id).of_type(:integer).with_options(:null => false) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(:null => false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
    it { should belong_to(:user) }
    it { should have_many(:images) }
    it { should validate_presence_of(:user_id) }
  end
end
