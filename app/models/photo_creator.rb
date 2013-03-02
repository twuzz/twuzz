class PhotoCreator
  attr_accessor :user, :datastore, :data

  def create!
    photo = nil
    ActiveRecord::Base.transaction do
      photo      = Photo.new
      photo.user = user
      photo.save!
      image           = Image.new
      image.photo     = photo
      image.original  = true
      image.size      = data.size
      image.width     = width
      image.height    = height
      image.mime_type = mime_type
      image.save!
      image_data           = ImageData.new
      image_data.image     = image
      image_data.datastore = datastore
      image_data.save!
      datastore.write_image_data image_data, data
    end
    photo
  end

  def width
    rmagick[0].columns
  end

  def height
    rmagick[0].rows
  end

  def mime_type
    rmagick[0].mime_type
  end

  def rmagick
    @rmagick ||= Magick::Image.from_blob data
  end
end
