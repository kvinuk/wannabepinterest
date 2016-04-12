class Board < ActiveRecord::Base
  before_save :sanitize_tags_list
  before_update :update_tags_list!
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :pins, through: :placements, inverse_of: :boards
  has_many :tags, dependent: :destroy

  validates :name, presence: true
  attr_accessor :tags_list


  private
  	def update_tags_list!
  		splitted_tags = tags_list.split(",")
  		current_tag_titles = self.tags.pluck(:title)
  		tags_to_delete = current_tag_titles - splitted_tags
  		tags_to_delete.each do |tag_to_delete|
  			self.tags.find_by(title: tag_to_delete).destroy
  		end

  		splitted_tags.each do |tag_name|
  			self.tags.find_or_initialize_by(name: tag_name, color: "white")
  		end
  	end

  	def sanitize_tags_list
  		tags_array = tags_list.split(',')
  		tags_array.each do |tag_name|
  			self.tags.find_or_initialize_by(name: tag_name, color: "white")
  		end
  	end

end
