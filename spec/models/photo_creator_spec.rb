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
  end
end
