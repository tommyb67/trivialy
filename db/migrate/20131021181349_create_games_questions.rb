class CreateGamesQuestions < ActiveRecord::Migration
  def change
    create_table :games_questions do |t|
      t.belongs_to :game, null: false
      t.belongs_to :question, null: false
    end

        reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE games_questions
          ADD CONSTRAINT fk_users
          FOREIGN KEY (game_id)
          REFERENCES games(id),
          ADD CONSTRAINT fk_songs
          FOREIGN KEY (question_id)
          REFERENCES questions(id)
        SQL
      end
    end
  end
end
