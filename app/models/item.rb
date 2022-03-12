class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category


  #conditions
  enum condition: {"Used" => 1 , "New" =>2}
  has_one_attached :picture
end
