require 'spec_helper'

describe PhotoCreator do
  describe 'instance' do
    let(:photo_creator) { PhotoCreator.new }
    subject { photo_creator }
    context 'with data' do
      let(:data) { File.read(File.join(Rails.root, 'spec', 'data', 'buster.jpg')) }
      before { photo_creator.data = data }
      its(:width)     { should == 275 }
      its(:height)    { should == 312 }
      its(:mime_type) { should == 'image/jpeg' }
    end

    context 'with user, datastore, and data' do
      let(:user) { FactoryGirl.create :user }
      let(:datastore) { FactoryGirl.create :filesystem_datastore, user: user }
      let(:data) { File.read(File.join(Rails.root, 'spec', 'data', 'buster.jpg')) }
      before do
        photo_creator.user      = user
        photo_creator.datastore = datastore
        photo_creator.data      = data
      end
      describe 'create!' do
        subject { photo_creator.create! }
        its(:user) { should == user }
      end
    end
  end
end
