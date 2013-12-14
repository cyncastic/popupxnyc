class Pricesinart < ActiveRecord::Migration
  def change
  	add_column :artworks, :price, :integer
  end
end
