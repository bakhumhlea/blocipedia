class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_confirmation_instructions
  
  private
  
  def send_confirmation_instructions
    ConfirmationsMailer.confirmation_instructions(self).deliver
  end
end
