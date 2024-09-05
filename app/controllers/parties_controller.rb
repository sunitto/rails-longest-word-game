class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @party = Party.new
  end

  def create
    @game = Game.find(params[:game_id])
    @party = Party.new(party_params)
    @party.game = @game
    if @party.save
      redirect_to game_party_path(@game, @party)
    else
      render :new
    end
  end
end
