class Bought < ApplicationRecord
belongs_to :user
belongs_to :category

    has_many :items
    has_one_attached :picture

    enum condition: {"Used" => 1 , "New" => 2}
end
