class AddHeartsRatingToThoughts < ActiveRecord::Migration
  def change
  	add_column :thoughts, :hearts, :integer, default: 0 
  end
end
