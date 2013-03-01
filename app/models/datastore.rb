class Datastore < ActiveRecord::Base
  belongs_to :user

  serialize :settings, OpenStruct

  validates :type,    presence: true
  validates :user_id, presence: true

  def write_image_data(image_data, data)
    raise "write_image_data(image_data, data) must be implemented in #{self.class}"
  end

  def read_image_data(image_data)
    raise "read_image_data(image_data) must be implemented in #{self.class}"
  end
end
