class GamesController < ApplicationController
  def index
    @games = Game.public.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  def show
    @game = Game.find(params[:id])
    @moves = @game.moves.order("created_at ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moves }
    end
  end

  def create
    @game = Game.new
    @game.public = params[:game][:public] == "1"
    @game.invite = params[:game][:invite]

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Started Game #' + @game.id.to_s }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { redirect_to games_url, notice: @game.errors.full_messages.join('; ') }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

end
