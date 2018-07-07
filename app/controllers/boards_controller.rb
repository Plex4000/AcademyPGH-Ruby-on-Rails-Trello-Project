class BoardsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @boards = Board.all
        @board = Board.new
        if (@boards.select('title').count == 0)
            @boards_empty = true
        end
    end

    def show
		@board = Board.find_by(id: params[:id])
		@new_list = List.new
		@card = Card.find_by(id: params[:id])
		@new_card = Card.new
	end

    def new
		@board = Board.new
    end
    
    def edit
		@board = Board.find_by(id: params[:id])
	end

    def create
		@board = Board.new(board_params)
		if @board.save
			redirect_to @board
		else
			render 'new'
		end
    end
    
    def update
		@board = Board.find_by(id: params[:id])
    	if @board.update(board_params)
      		redirect_to @board
    	else
      		render 'edit'
    	end
	end

    def destroy
		@board = Board.find_by(id: params[:id])
		@board.destroy
		redirect_to boards_path
	end

private
def board_params
  params.require(:board).permit(:title)
end

end
