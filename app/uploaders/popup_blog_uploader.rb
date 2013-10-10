# encoding: utf-8

class PopupBlogUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # storage :file
  storage :fog

  def store_dir
    Rails.env.production? ? (primary_folder = "production") : (primary_folder = "test")
    "uploads/#{primary_folder}/#{model.class.to_s.underscore}/"
  end

  version :large do
    process :resize_to_limit => [960, 960]
  end

end
