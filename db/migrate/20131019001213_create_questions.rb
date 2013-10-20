class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.string :category, null: false
      t.string :answer, null: false
      t.integer :difficulty, null: false
      t.string :question, null: false

      t.timestamps
    end
  end
end