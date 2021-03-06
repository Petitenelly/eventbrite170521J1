class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :welcome_send

    has_many :attendances
    has_many :events, through: :attendances
    has_many :organised_events, foreign_key: 'admin', class_name: 'Event'

    #validates :first_name,presence: true
    #validates :last_name, presence: true
    validates :encrypted_password,presence: true,length: { minimum: 6, maximum: 100 }
    validates :email,presence: true,uniqueness: true,format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: 'Veuillez saisir un email valide svp' }
  
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end