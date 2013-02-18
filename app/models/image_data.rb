class ImageData < ActiveRecord::Base
  belongs_to :image
  belongs_to :datastore

  validates :image_id,     presence: true
  validates :datastore_id, presence: true
end
