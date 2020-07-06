class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end
end
