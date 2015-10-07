class Resource < ActiveRecord::Base
  belongs_to :assignment
  validates :name, presence: true, uniqueness: true
  validates :source, presence: true
end
