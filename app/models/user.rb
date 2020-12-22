class User < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: uniqueness: { case_sensitive: false }
end
