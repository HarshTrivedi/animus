class AddAvatarToSapien < ActiveRecord::Migration
  def self.up
  	add_attachment :sapiens, :avatar
  end

  def self.down
  	remove_attachment :sapiens, :avatar
  end
end
