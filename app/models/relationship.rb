class Relationship < ActiveRecord::Base
  attr_accessible :admirer_id, :inspirer_id
  belongs_to :admirer, :foreign_key => "admirer_id", :class_name => "Sapien"
  belongs_to :inspirer, :foreign_key => "inspirer_id", :class_name => "Sapien"
  validates :admirer_id, :presence => true
  validates :inspirer_id, :presence => true
end
