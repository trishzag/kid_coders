class Group < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :name, inclusion: { in: %w(K-5 MS HS), 
            message: "%{value} is not a valid group" }
  validates :name, uniqueness: { scope: :id }
end
