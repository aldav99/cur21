class DeleteBadgeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :title
    remove_column :badges, :imgfile
    remove_column :badges, :category_id
    remove_column :badges, :level
    remove_column :badges, :try
  end
end
