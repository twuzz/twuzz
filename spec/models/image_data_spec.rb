require 'spec_helper'

describe ImageData do
  describe 'attributes' do
    let(:image_data) { FactoryGirl.create :image_data }
    subject { image_data }
    it { should have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:image_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:datastore_id).of_type(:integer).with_options(null: false) }
    it { should have_db_index([ :image_id, :datastore_id ]).unique(true) }
    it { should have_db_index(:datastore_id) }
    it { should belong_to(:image) }
    it { should belong_to(:datastore) }
    it { should validate_presence_of(:image_id) }
    it { should validate_presence_of(:datastore_id) }
  end
end
