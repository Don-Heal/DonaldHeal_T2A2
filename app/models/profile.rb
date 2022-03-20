class Profile < ApplicationRecord
    validates_uniqueness_of :username
    belongs_to :user
    has_one_attached :picture
end
