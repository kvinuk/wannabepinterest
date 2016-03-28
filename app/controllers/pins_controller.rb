class PinsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = current_user.boards.find(params[:board_id])
    @pin = @board.pins.build
  end

  def create
    @board = current_user.boards.find(params[:board_id])
    @pin = @board.pins.build(pin_params)

    if @pin.save
      redirect_to @board, notice: "Tu pin se ha creado"
    else
      redirect_to @board, notice: "Ocurrio un error"
    end
  end

  private

    def pin_params
      params.require(:pin).permit(:image)
    end
end
