class AddCallToReraisePreflopToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :call_to_reraise_preflop, :integer, :default => 0
  end
end
