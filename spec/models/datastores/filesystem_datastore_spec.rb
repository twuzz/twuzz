require 'spec_helper'

describe FilesystemDatastore do
  describe 'instance method' do
    let(:filesystem_datastore) { FactoryGirl.build :filesystem_datastore }
  end

  describe 'instance' do
    let(:filesystem_datastore) { FilesystemDatastore.new }

    describe 'write_image_data' do
      context 'given ImageData and data' do
        let(:image_data) { ImageData.new }
        let(:data) { File.read File.join(Rails.root, 'spec', 'data', 'buster.jpg') }
        let(:tmp_directory) { File.join(Rails.root, 'tmp', SecureRandom.hex(32)) }
        let(:tmp_path) { File.join(tmp_directory, SecureRandom.hex(32)) }
        before do
          filesystem_datastore.should_receive(:path_for_image_data).with(image_data).and_return(tmp_path)
          filesystem_datastore.write_image_data image_data, data
        end
        context 'directory for path_for_image_data(image_data) does not exist' do
          it 'should create the directory' do
            Dir.exists?(File.dirname(tmp_path)).should be_true
          end
        end
        it 'should create a file at path_for_image_data(image_data)' do
          File.exists?(tmp_path).should be_true
        end
        it 'should write given data to path_for_image_data(image_data)' do
          File.read(tmp_path).should == data
        end
        after do
          File.delete tmp_path
          Dir.delete tmp_directory
        end
      end
    end

    describe 'read_image_data' do
      context 'given ImageData' do
        let(:image_data) { ImageData.new }
        let(:fixture_path) { File.join Rails.root, 'spec', 'data', 'buster.jpg' }
        before { filesystem_datastore.should_receive(:path_for_image_data).with(image_data).and_return(fixture_path) }
        subject { filesystem_datastore.read_image_data(image_data) }
        it 'should return contents of file at path_for_image_data(image_data)' do
          should == File.read(fixture_path)
        end
      end
    end

    describe 'directory_for_image_data' do
      context 'given ImageData with id' do
        let(:image_data) { ImageData.new }
        let(:id) { 12345 }
        before { image_data.id = id }
        subject { filesystem_datastore.directory_for_image_data image_data }
        it { should == 'ImageData-12000-through-12999' }
      end
    end

    describe 'filename_for_image_data' do
      context 'given ImageData with id' do
        let(:image_data) { ImageData.new }
        let(:id) { 12345 }
        before { image_data.id = id }
        subject { filesystem_datastore.filename_for_image_data image_data }
        it { should == 'ImageData-12345' }
      end
    end  

    describe 'root=' do
      let(:new_root) { 'new_root' }
      before { filesystem_datastore.root = new_root }
      it('should set settings.root to given value') { filesystem_datastore.settings.root == new_root }
    end

    context 'with settings.root' do
      let(:root) { File.join Rails.root, 'spec', 'data' }
      before { filesystem_datastore.settings.root = root }

      describe 'path_for_image_data' do
        context 'given ImageData with id' do
          let(:image_data) { ImageData.new }
          let(:id) { 12345 }
          before { image_data.id = id }
          subject { filesystem_datastore.path_for_image_data image_data }
          it { should == File.join(filesystem_datastore.root, 'ImageData-12000-through-12999/ImageData-12345') }
        end
      end

      describe 'root' do
        subject { filesystem_datastore.root }
        it('should return settings.root') { should == filesystem_datastore.settings.root }
      end
    end
  end
end
