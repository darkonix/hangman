class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :game_id
      t.integer :points
      t.boolean :win

      t.timestamps
    end
  end
end
