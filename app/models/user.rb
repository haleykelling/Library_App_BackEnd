class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end
end
