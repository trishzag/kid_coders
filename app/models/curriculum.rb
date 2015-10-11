class Curriculum < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :userplans, dependent: :destroy
  has_many :users, through: :userplans
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, in: 4..25, allow_blank: false
  validates :name, uniqueness: { scope: :id }
end
