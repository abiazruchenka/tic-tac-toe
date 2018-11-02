class GamesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:move]

  def index; end

  def move
    game_service = GamesService.new(params, flash[:current_user], flash[:results])
    @message = game_service.message
    flash[:current_user], flash[:results] = game_service.update_flash
    @victory = game_service.check_results
    render '_sign', layout: false
  end

  def new
    flash.clear
    redirect_to games_path
  end
end
