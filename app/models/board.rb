class Board < ActiveRecord::Base
  belongs_to :user
  has_many :placements
  has_many :pins, through: :placements, inverse_of: :boards

  validates :name, presence: true
end
