class AddNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :name, :string, :after => :user_id
  end
end
