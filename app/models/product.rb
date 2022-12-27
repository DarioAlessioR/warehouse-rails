class Product < ApplicationRecord
  has_many :movements, dependent: :destroy
  validates :name, presence: true
  validates :reference, presence: true

  def quantity
    total = 0
    self.movements.each do |movement|
      if movement.movement_type == Movement::MovementTypes[:add]
        total += movement.movement_quantity
      else
        total -= movement.movement_quantity
      end
    end
    total
  end

end
