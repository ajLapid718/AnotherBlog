class AddIndexToPostIdInCommentsTable < ActiveRecord::Migration[5.1]
  def change
    add_index :comments, :post_id
  end
end
