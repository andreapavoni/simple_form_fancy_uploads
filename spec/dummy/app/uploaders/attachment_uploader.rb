# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(pdf txt)
  end

  # Sanitize filename
  def sanitize_regexp
    /[^[:word:]\.\-\+]/
  end

end
