class Datastore < ActiveRecord::Base
  belongs_to :user

  serialize :settings, OpenStruct

  validates :type,    presence: true
  validates :user_id, presence: true
end
