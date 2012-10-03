class Member < ActiveRecord::Base
  attr_accessible :scope_id, :user_id
  belongs_to :scope, class_name: "Scope"
  belongs_to :user, class_name: "User"

  validates :scope_id, presence: true
  validates :user_id, presence: true
end
