class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :word_id
      t.integer :points
      t.boolean :win
      t.string :right_letters, default: ''
      t.string :wrong_letters, default: '' 
      
      t.timestamps
    end
  end
end
