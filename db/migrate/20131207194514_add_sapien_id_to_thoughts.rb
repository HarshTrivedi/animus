class AddSapienIdToThoughts < ActiveRecord::Migration
  def change
  	add_column :thoughts, :sapien_id, :integer
  	add_index :thoughts, :sapien_id
  	remove_column :thoughts, :name
  end
end
