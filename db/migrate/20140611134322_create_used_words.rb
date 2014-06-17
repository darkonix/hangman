class CreateUsedWords < ActiveRecord::Migration
  def change
    create_table :used_words do |t|
      t.integer :round_id
      t.integer :word_id

      t.timestamps
    end
  end
end
