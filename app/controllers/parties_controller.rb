class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @party = @game.parties.new
  end

  def create
    @game = Game.find(params[:game_id])
    @party = @game.parties.new(party_params)
    @party.game = @game
    if @party.save
      redirect_to game_party_path(@game, @party)
    else
      render :new
    end
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end
end
