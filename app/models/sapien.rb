class Sapien < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :remember_me, :agnomen, :avatar
  validates :agnomen, presence: true, 
  					  uniqueness: true,
  					  format: {
  					  	with: /\A[a-zA-Z\-\_]+\Z/,
  					  	message: 'Must be formatted correctly.'
  					  }

  has_attached_file :avatar, :default_url => '/assets/heart4.png'
  validates_attachment_size :avatar, :less_than => 4.megabytes
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  # attr_accessible :title, :body
  has_many :thoughts
  has_many :relationships, :dependent => :destroy,
                           :foreign_key => "admirer_id"
  has_many :reverse_relationships, :dependent => :destroy,
                                   :foreign_key => "inspirer_id",
                                   :class_name => "Relationship"
  has_many :inspirers, :through => :relationships, :source => :inspirer
  has_many :admirers, :through => :reverse_relationships, :source => :admirer

  after_create :send_welcome_mail
  def inspired?(inspirer)
    relationships.find_by_inspirer_id(inspirer)
  end

  def admire!(inspirer)
    relationships.create!(:inspirer_id => inspirer.id)
  end

  def disadmire!(inspirer)
    relationships.find_by_inspirer_id(inspirer).destroy
  end

  def send_welcome_mail
    SapienMailer.welcome(self).deliver
  end
end
