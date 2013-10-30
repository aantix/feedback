class AddQuestionIdToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :question_id, :integer
  end
end
