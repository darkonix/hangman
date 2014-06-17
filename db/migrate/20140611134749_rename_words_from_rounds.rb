class RenameWordsFromRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :right_rounds, :string
    remove_column :rounds, :wrong_rounds, :string
    add_column :rounds, :right_letters, :string
    add_column :rounds, :wrong_letters, :string
  end
end