# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :moderators
  has_many :members
  # has_many :moderates, through: :moderators, source: "user" # dependent: :destroy #might not be grammatically correct
  # has_many :memberships, through: :members, source: "user" # dependent: :destroy #might not be grammatically correct


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /^[\(\)0-9\- \+\.]{10,20}$/
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  # validates :phone, format: { with: VALID_PHONE_REGEX },
            # uniqueness: { case_sensitive: false }, presence: false

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end
# 
  # def moderates?(scope)
    # moderates.find_by_scope_id(scope.id)
  # end
# 
  # def moderate!(scope) #should not be used
    # moderators.create!(user_id: self.id, scope_id: scope.id)
  # end
#   
  # def abandon!(scope)
    # moderates.find_by_scope_id(scope.id).destroy
  # end
#   
  # def member?(scope)
    # memberships.find_by_scope_id(scope.id)
  # end
# 
  # def join!(scope)
    # members.create!(user_id: self.id, scope_id: scope.id)
  # end
#   
  # def leave!(scope)
    # memberships.find_by_scope_id(scope.id).destroy
  # end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  


end
