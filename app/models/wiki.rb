class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  validates :title, length: { minimum: 4 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :private, presence: true, allow_blank: true
  validates :user, presence: true
  
  default_scope { order('created_at DESC') }
  
end
