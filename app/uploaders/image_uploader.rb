# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [500, 500]

  version :rollover do
    process :resize_to_fill => [665,401]
    process :quality => 100 
  end

  version :list do
    process :resize_to_fill => [136,136]
    process :quality => 100 
  end

  version :heading do
    process :resize_to_fill => [294,177]
    process :quality => 100 
  end

  version :blog_index do
    process :resize_to_fill => [311,187]
    process :quality => 100 
  end

  version :ejercicio_del_mes do
    process :resize_to_fill => [114,69]
    process :quality => 100 
  end

end
