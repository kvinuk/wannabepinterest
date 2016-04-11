class Board < ActiveRecord::Base
  before_save :sanitize_tags_list
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :pins, through: :placements, inverse_of: :boards
  has_many :tags, dependent: :destroy

  validates :name, presence: true
  attr_accessor :tags_list
  private
  	def sanitize_tags_list
  		tags_array = tags_list.split(',')
  		tags_array.map do |tag_name|
  			self.tags.build(name: tag_name, color: "white")
  		end
  	end

end
