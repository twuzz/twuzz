require 'spec_helper'

describe Image do
  describe 'attributes' do
    let(:image) { FactoryGirl.create :image }
    subject { image }
    it { should have_db_column(:id).of_type(:integer).with_options(:null => false) }
    it { should have_db_column(:photo_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:original).of_type(:boolean).with_options(null: false, default: false) }
    it { should have_db_column(:mime_type).of_type(:string).with_options(null: false) }
    it { should have_db_column(:size).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:width).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:height).of_type(:integer).with_options(null: false) }
    it { should belong_to(:photo) }
    it { should validate_presence_of(:photo_id) }
    it { should validate_presence_of(:original) }
    it { should validate_presence_of(:mime_type) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:width) }
    it { should validate_presence_of(:height) }
  end
end
