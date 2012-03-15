# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Sanitize filename
  def sanitize_regexp
    /[^[:word:]\.\-\+]/
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def default_url
    "fancy-upload-default-url.png"
  end
end
