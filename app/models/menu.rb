class Menu < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates_presence_of :title, :author
end
