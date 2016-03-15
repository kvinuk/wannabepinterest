class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)

    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def board_params
      params.require(:board).permit(:name)
    end
end
