class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :descript
      t.integer :user_id
      t.integer :article_id
      t.datetime :create_time
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
