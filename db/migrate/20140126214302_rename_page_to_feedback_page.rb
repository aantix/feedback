class RenamePageToFeedbackPage < ActiveRecord::Migration
  def up
    rename_table :pages, :feedback_pages
    rename_column :feedbacks, :page_id, :feedback_page_id
  end

  def down
    rename_table :feedback_pages, :pages
    rename_column :feedbacks, :feedback_page_id, :page_id
  end
end
