class User < ApplicationRecord
  has_many :wikis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  after_create :send_confirmation_instructions
  
  before_save { self.email = email.downcase if email.present? }
  ##before_save { self.role ||= :standard }
  after_initialize :init

  validates :username, length: { minimum: 1, maximum: 25 }, presence: true

  validates :password, presence: true, length: { minimum: 8 }, if: "encrypted_password.nil?"
  validates :password, length: { minimum: 8 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
  
  enum role: [:standard, :premium, :admin]
  
  def avatar_generator
    avatar_urls = ["https://pa1.narvii.com/6299/95fff07a4727ab6829aed5cac4a7fe35fc86e07a_128.gif",
                  "https://pa1.narvii.com/6061/73b944cc5101983b8a5be664561cacf09e181fba_128.gif",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdFa_tm_ekvRQN82RDnlupzVjaT_kPisouWzDdyYIFLGGShXPAKg",
                  "https://pa1.narvii.com/5676/fafaf7e5d2bb93144e77cdf7424df64681a342ee_128.gif",
                  "https://pa1.narvii.com/6001/3ba7ac31e53517d6182b3c260a48a03435f2b67b_128.gif",
                  "https://pa1.narvii.com/5843/499609ce481d5471d53764f4f737dd0a8e9e9cfd_128.gif",
                  "http://pa1.narvii.com/6288/15fcfb2a0e8e35f6bca56a86cef63056362b0c19_128.gif"]
    avatar_urls[rand(0..avatar_urls.length-1)]
  end
  
  private
  
  def init
    self.role ||= :standard
  end
  
  def send_confirmation_instructions
    ConfirmationsMailer.confirmation_instructions(self, @token, {})
  end
  
  def confirmation_required?
    false
  end
  
end
