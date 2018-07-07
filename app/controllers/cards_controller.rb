class CardsController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    def show
		@card = Card.find_by(id: params[:id])
	end

	def new
		@card = Card.new
	end

	def edit
		@card = Card.find_by(id: params[:id])
	end

	def create
        @list = List.find_by(params[:card][:list_id])
		@card = @list.cards.build(card_params)
		if @card.save
			redirect_to @list.board
		else
			render 'new'
		end
	end

	def update
		@card = Card.find_by(id: params[:id])
		if @card.update(card_params)
			redirect_to @card.list
		else
			render 'edit'
		end
	end

	def destroy
		@card = Card.find_by(id: params[:id])
		@card.destroy
		redirect_to @card.list 
	end

private

	def card_params
  		params.require(:card).permit(:title, :position)
	end
end
