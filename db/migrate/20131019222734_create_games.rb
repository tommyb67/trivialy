class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score, null: false

      t.timestamps
    end
  end
end
