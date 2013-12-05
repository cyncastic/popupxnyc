# encoding: utf-8

class PopupUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # storage :file
  storage :fog

  def store_dir
    Rails.env.production? ? (primary_folder = "production") : (primary_folder = "test")
    "uploads/#{primary_folder}/#{model.class.to_s.underscore}/"
  end

  version :large do
    process :resize_to_limit => [984, 984]
  end

  version :thumb do
    process :crop
    process :resize_to_fill => [336, 336]
  end

  version :icon do
    process :crop
    process :resize_to_fill => [48, 48]
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(950, 950)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end
end
