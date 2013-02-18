class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :user_id, :presence => true
end
