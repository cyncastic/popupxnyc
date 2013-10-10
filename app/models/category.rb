class Category < ActiveRecord::Base

  has_many :artworks

  validates :name, presence: true

  before_destroy :ensure_category_has_no_artwork

  private
  
  def ensure_category_has_no_artwork
    if artworks.empty?
      return true 
    else
      errors.add(:base, 'Artwork present')
      return false
    end
  end

end
