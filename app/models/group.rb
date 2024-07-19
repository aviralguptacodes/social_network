class Group < ApplicationRecord

    has_many :posts
    has_and_belongs_to_many :users
end
