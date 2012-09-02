class MovesController < ApplicationController
  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(params[:move])

    respond_to do |format|
      if @move.save
        format.json { render json: @move, status: :created, location: @move }
      else
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
