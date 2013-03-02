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

  describe 'instance' do
    let(:datastore) { Datastore.new }

    describe 'write_image_data' do
      it { lambda{ datastore.write_image_data nil, nil }.should raise_error('write_image_data(image_data, data) must be implemented in Datastore') }
    end

    describe 'read_image_data' do
      it { lambda{ datastore.read_image_data nil }.should raise_error('read_image_data(image_data) must be implemented in Datastore') }
    end
  end
end
