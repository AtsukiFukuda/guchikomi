class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :cheers, dependent: :destroy
    has_many :cheered_users, through: :cheers, source: :user

    has_many :forgets, dependent: :destroy
    has_many :forgot_users, through: :forgets, source: :user
    
    has_many :talks, dependent: :destroy
end
