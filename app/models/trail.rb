class Trail < ApplicationRecord
    has_many :user_trails
    has_many :users, through: :user_trails 
end
