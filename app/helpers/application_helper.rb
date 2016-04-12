module ApplicationHelper
	def board_tags_list(board)
		board.tags.pluck(:name).join(",")
	end
end
