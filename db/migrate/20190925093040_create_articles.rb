class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :category_id
      t.string :image
      t.string :descript
      t.datetime :create_time

      t.timestamps
    end
  end
end
