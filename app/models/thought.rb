class Thought < ActiveRecord::Base
  attr_accessible :content, :sapien_id, :private, :hearts
  validates :content, presence: true,
  					  length: {minimum: 10}
  belongs_to :sapien

  def heart_id(id)
  	t = Thought.find(id)
  	t.hearts += 1
  end
end
