class AddQuestionTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_type_id, :integer, :default => 1
  end
end
