class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number_hands, :default => 0
      t.integer :vpip, :default => 0
      t.integer :pfr, :default => 0
      t.integer :"3b", :default => 0
      t.integer :f3b, :default => 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
