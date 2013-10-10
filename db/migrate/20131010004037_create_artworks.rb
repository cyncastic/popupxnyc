class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :category_id
      t.integer :position
      t.string :image
      t.boolean :sold
      t.string :medium
      t.integer :length
      t.integer :width
      t.integer :year

      t.timestamps
    end
  end
end
