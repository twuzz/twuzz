class Image < ActiveRecord::Base
  belongs_to :photo

  validates :photo_id,  presence: true
  validates :original,  presence: true
  validates :mime_type, presence: true
  validates :size,      presence: true
  validates :width,     presence: true
  validates :height,    presence: true
end
