class RemoveAncestryColumnFromCommentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :ancestry
  end
end
