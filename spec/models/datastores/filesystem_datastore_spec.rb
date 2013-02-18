require 'spec_helper'

describe FilesystemDatastore do
  describe 'instance method' do
    let(:filesystem_datastore) { FactoryGirl.build :filesystem_datastore }

    describe 'path' do
      subject { filesystem_datastore.path }
      it { should == '' }
    end
  end
end
