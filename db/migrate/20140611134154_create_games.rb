class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :token
      t.string :ip

      t.timestamps
    end
  end
end
