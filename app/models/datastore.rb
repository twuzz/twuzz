class Datastore < ActiveRecord::Base
  belongs_to :user

  validates :type,    presence: true
  validates :user_id, presence: true
end
