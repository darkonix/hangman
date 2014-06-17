class AddWordsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :right_rounds, :string
    add_column :rounds, :wrong_rounds, :string
  end
end