class AddLikeIdToComment < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.belongs_to :like
    end
  enddb
end




