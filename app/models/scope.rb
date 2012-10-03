class Scope < ActiveRecord::Base
  attr_accessible :name, :scope_id
  has_many :moderators, foreign_key: "scope_id", dependent: :destroy
  has_many :members, foreign_key: "scope_id", dependent: :destroy
  validates :name, presence: true
end
