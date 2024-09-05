class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def create
    @game = Game.new(user: current_user)
    if @game.save
      redirect_to game_path(@game)
    else
      render :index
    end
  end

  def show
    @game = Game.find(params[:id])
    @parties = @game.parties
  end
end
