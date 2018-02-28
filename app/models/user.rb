class User < ApplicationRecord
  has_many :wikis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  after_create :send_confirmation_instructions
  
  before_save { self.email = email.downcase if email.present? }

  validates :username, length: { minimum: 1, maximum: 25 }, presence: true

  validates :password, presence: true, length: { minimum: 8 }, if: "encrypted_password.nil?"
  validates :password, length: { minimum: 8 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  private
  
  def send_confirmation_instructions
    ConfirmationsMailer.confirmation_instructions(self, @token, {})
  end
  
  def confirmation_required?
    false
  end
end
