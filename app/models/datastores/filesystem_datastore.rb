class FilesystemDatastore < Datastore
  IDS_PER_FOLDER = 1_000

  def write_image_data(image_data, data)
    path = path_for_image_data image_data
    directory = File.dirname path
    FileUtils.mkdir_p directory
    File.open(path, 'w') do |file|
      file.write data
    end
  end

  def read_image_data(image_data)
    File.read path_for_image_data(image_data)
  end

  def path_for_image_data(image_data)
    File.join root, directory_for_image_data(image_data), filename_for_image_data(image_data)
  end

  def directory_for_image_data(image_data)
    range_start = image_data.id / IDS_PER_FOLDER * IDS_PER_FOLDER
    range_stop = range_start + IDS_PER_FOLDER - 1
    "#{image_data.class.base_class}-#{range_start}-through-#{range_stop}"
  end

  def filename_for_image_data(image_data)
    "#{image_data.class.base_class}-#{image_data.id}"
  end

  def root; settings.root; end
  def root=(value); settings.root = value; end
end
