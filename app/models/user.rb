class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, :uniqueness => { :case_sensitive => false }

    has_many :entries
    has_many :journals, through: :entries

    validates :password, length: { minimum: 6 }, if: :password_digest_changed?
    validates :password, confirmation: { case_sensitive: true }
    validate :is_email?

    def is_email?
        if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
          errors.add(:email, "Give me a real email dammit")
        end 
      end   
    
end
