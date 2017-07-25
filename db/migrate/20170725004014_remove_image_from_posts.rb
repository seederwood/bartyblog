class RemoveImageFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :image
  end
end
