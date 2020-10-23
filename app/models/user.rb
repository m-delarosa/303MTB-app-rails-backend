class User < ApplicationRecord
    before_create :confirmation_token
    has_secure_password

    has_many :user_trails
    has_many :trails, through: :user_trails

    validates :name, :username, :email, presence: {message: "%{attribute} cannont be blank."}
    validates :username, length: { minimum: 5, maximum: 20, message: "%{attribute} must be between 5 and 20 characters long." }
    validates :username, uniqueness: {message: "%{attribute}s must be unique, and %{value} has already been taken."}

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

end
