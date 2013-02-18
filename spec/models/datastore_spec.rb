require 'spec_helper'

describe Datastore do
  describe 'attributes' do
    let(:datastore) { FactoryGirl.create :datastore }
    subject { datastore }
    it { should have_db_column(:id).of_type(:integer).with_options(:null => false) }
    it { should have_db_column(:type).of_type(:string).with_options(null: false) }
    it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:settings).of_type(:text) }
    it { should have_db_index(:user_id) }
    it { should belong_to(:user) }
    it { should serialize(:settings).as(OpenStruct) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:user_id) }
  end
end
