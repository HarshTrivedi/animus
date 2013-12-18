class AddPrivateAtributeToThoughts < ActiveRecord::Migration
  def change
  	add_column :thoughts, :private, :boolean, default: false
  end
end
