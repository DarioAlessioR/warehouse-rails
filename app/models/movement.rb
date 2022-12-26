class Movement < ApplicationRecord
  belongs_to :product
  MovementTypes = {add: 0, remove: 1}
  validates :movement_quantity, presence: true, numericality: true

  def self.get_movement_types
    {
      "Add" => MovementTypes[:add],
      "Remove" => MovementTypes[:remove]
    }
  end
end
