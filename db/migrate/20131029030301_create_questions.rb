class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :question

      t.timestamps
    end

    Question.seed_questions
  end
end
