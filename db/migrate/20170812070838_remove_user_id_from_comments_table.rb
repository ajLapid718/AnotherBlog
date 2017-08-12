class RemoveUserIdFromCommentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :user_id
  end
end
