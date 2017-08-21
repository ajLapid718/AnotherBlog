class RemoveCommentableColumnsFromCommentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
