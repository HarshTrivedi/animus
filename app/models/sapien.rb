class Sapien < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :agnomen	
  validates :agnomen, presence: true, 
  					  uniqueness: true,
  					  format: {
  					  	with: /\A[a-zA-Z\-\_]+\Z/,
  					  	message: 'Must be formatted correctly.'
  					  }

  # attr_accessible :title, :body
  has_many :thoughts
end
