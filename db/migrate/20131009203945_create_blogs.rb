class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :post
      t.date :posted
      t.string :image

      t.timestamps
    end
  end
end
