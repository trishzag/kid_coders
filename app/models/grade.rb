class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  validates :name, presence: true, uniqueness: true
end
