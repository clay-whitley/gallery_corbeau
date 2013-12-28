class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.string :author

      t.datetime :posted_at

      t.timestamps
    end
  end
end
