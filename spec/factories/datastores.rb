FactoryGirl.define do
  factory :datastore do
    user
    type 'type'
  end

  factory :filesystem_datastore, class: 'FilesystemDatastore' do
    user
    settings OpenStruct.new(root: File.join(Rails.root, 'spec', 'data'))
  end
end
