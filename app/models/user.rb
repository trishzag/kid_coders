class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable
  belongs_to :group
  has_many :grades
  has_many :userplans
  has_many :curricula
  has_many :assignments, through: :curricula
  validates :username, presence: true, length: { maximum: 15 }
  validates :username, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :email, uniqueness: true
  validates_length_of :password, in: 8..15, allow_blank: false
  validate :validate_username

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  attr_accessor :login

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(
      ["lower(username) = :value OR lower(email) = :value", { value: login.downcase }])
      .first
    else
      where(conditions.to_hash).first
    end
  end
end
