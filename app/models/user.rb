class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable
  attr_accessor :login
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

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
