class AddFoldOnReraisePreflopToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :fold_on_reraise_preflop, :integer, :default => 0
  end
end
