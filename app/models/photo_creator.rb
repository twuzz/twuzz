class PhotoCreator
  attr_accessor :user, :datastore, :data

  def create!
    photo = Photo.new
    photo.user = user
    
  end

  def rmagick
    Magick::Image.from_blob data
  end
end
