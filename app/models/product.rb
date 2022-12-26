class Product < ApplicationRecord
  has_many :movements
  validates :name, presence: true
  validates :reference, presence: true
end
