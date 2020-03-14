class AddFolderIdtoPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :folder_id, :integer
  end
end
