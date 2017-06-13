class PlayersController < OpenReadController
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @current_user_id = current_user.id
    @players = Player.where(user_id: @current_user_id)
    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = current_user.players.build(create_player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
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
    def player_params
      params.require(:player).permit(
        :id,
        :name,
        :hand_count,
        :call_preflop,
        :raise_preflop,
        :call_or_raise_preflop,
        :reraise_preflop,
        :call_to_reraise_preflop,
        :fold_on_reraise_preflop,
        :user_id)
    end

    def create_player_params
      params.require(:player).permit(:name, :user_id)
    end
end
