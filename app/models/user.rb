class User < ActiveRecord::Base
  has_many :photos
  has_many :datastores

  has_secure_password

  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def to_s
    if first_name.blank? && last_name.blank?
      email
    else
      "#{first_name} #{last_name}".strip
    end
  end
end
