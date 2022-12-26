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

  def movement_type_name
    case movement_type
    when MovementTypes[:add]
      "Add"
    when MovementTypes[:remove]
      "Remove"
    else
      "Unknown"
    end
  end
end

