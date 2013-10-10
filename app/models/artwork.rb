class Artwork < ActiveRecord::Base
  belongs_to :category

  validates :title, :image, :category_id, presence: true

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_avatar

  mount_uploader :image, PopupUploader

  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end

end
