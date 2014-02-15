class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :name
      t.timestamps
    end

    QuestionType.create(:name => "Visual") do |r|
      r.id = QuestionType::VISUAL
      r.save
    end
    QuestionType.create(:name => "Copy Text") do |r|
      r.id = QuestionType::COPY_TEXT
      r.save
    end
    QuestionType.create(:name => "Functional") do |r|
      r.id = QuestionType::FUNCTIONAL
      r.save
    end
  end
end
