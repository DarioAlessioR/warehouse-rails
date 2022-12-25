class Product < ApplicationRecord
  validates :name, presence: true
  validates :reference, presence: true
end
