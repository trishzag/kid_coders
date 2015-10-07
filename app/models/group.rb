class Group < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :name, uniqueness: { scope: :id }
end
