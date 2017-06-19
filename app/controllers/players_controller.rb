class PlayersController < OpenReadController
  before_action :set_player, only: [:destroy]
  # before_action :set_player_update, only: [:update]

  # GET /players
  def index
    @current_user_id = current_user.id
    @players = Player.where(user_id: @current_user_id)
    render json: @players
  end

  # PATCH /player
  def show
    @name = params[:player][:name]
    @player = current_user.players.find_by(name: @name)
    if current_user.players.exists?(name: @name)
      render json: @player
    else
      render status: 404
    end
  end

  # POST /players/save
  def update
    @name = params[:player][:name]
    if current_user.players.exists?(name: @name)
      @player_update = current_user.players.find_by_name(@name)
      if @player_update.update(player_params_save)
        render json: @player_update
      else
        render json: @player_update.errors, status: :unprocessable_entity
      end
    else
      @player = current_user.players.build(player_params_save)
      if @player.save
        render json: @player, status: :created, location: @player
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = current_user.players.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params_save
      params.require(:player).permit(
        :name,
        :hand_count,
        :call_preflop,
        :raise_preflop,
        :call_or_raise_preflop,
        :reraise_preflop,
        :call_to_reraise_preflop,
        :fold_on_reraise_preflop)
    end
end
