# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process :resize_to_fill => [60, 60]
  end

  process :resize_to_limit => [690, 1024]

end
