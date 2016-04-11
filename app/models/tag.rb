class Tag < ActiveRecord::Base
  belongs_to :board
  validates :name, :color, presence: true
end
