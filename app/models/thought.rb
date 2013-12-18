class Thought < ActiveRecord::Base
  attr_accessible :content, :sapien_id, :private
  validates :content, presence: true,
  					  length: {minimum: 10}
  belongs_to :sapien
end
