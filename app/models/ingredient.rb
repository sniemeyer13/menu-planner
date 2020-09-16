class Ingredient < ApplicationRecord
  belongs_to :menu

  validates_presence_of :name
end
