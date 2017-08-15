class RemoveNameFromCommentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :name
  end
end
