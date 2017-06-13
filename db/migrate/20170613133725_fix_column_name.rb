class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :players, :vpip, :call_preflop
    rename_column :players, :pfr, :raise_preflop
    rename_column :players, :"3b", :call_or_raise_preflop
    rename_column :players, :f3b, :reraise_preflop
    rename_column :players, :number_hands, :hand_count
  end
end
