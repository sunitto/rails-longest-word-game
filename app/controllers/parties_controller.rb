class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    if @game.parties.count < 5
      @party = @game.parties.new
    else
      flash[:alert] = "vous ne pouvez pas créer plus de 5 parties dans ce jeu"
      redirect_to game_path(@game)
    end
  end

  def create
    @game = Game.find(params[:game_id])
    if @game.parties.count < 5
      @party = @game.parties.new(party_params)
      @party.game = @game
      @party.ten_letters_list = Party.new.ten_letters_list
      if Party.verif_word(@party.ten_letters_list, @party.word)
        if @party.save
          redirect_to game_party_path(@game, @party)
        else
          render :new
        end
      else
        flash[:alert] = "Le mot '#{@party.word}' n'est pas valide."
      render :new
      end
    else
      flash[:alert] = "vous ne pouvez pas créer plus de 5 parties dans ce jeu"
      redirect_to game_path(@game)
    end
  end

  def show
    @party = Party.find(params[:id])
    @game = @party.game
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end
end
