class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessor :login

  has_many :grades, dependent: :destroy
  has_many :userplans, dependent: :destroy
  has_many :curricula, through: :userplans
  has_many :assignments, through: :curricula

  validates :username, presence: true, length: { maximum: 15 }
  validates :username, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :password, length: { in: 8..15 }, allow_blank: false
  validates :assignment_complete, presence: true, numericality: true
  validates :assignment_complete, numericality: { greater_than: -1 }
  validate :validate_username
  validate :validate_email

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

  def validate_email
    if User.where(username: email).exists?
      errors.add(:email, :invalid)
    end
  end

  def admin?
    self.admin == true
  end

  def graded?
    assignment.grade == "Pass" || assignment.grade == "Needs Work"
  end

  def complete?
    assignment.grade == "Pass"
  end

  def count
    total = 0
    @user.assignments.each do |assignment|
      if assignment.complete?
        total += 1
      end
    end
    @user.assignment_complete = total
  end

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(
        ["lower(username) = :value OR lower(email) = :value",
          { value: login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
