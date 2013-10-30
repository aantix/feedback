class AddSiteToPrelaunches < ActiveRecord::Migration
  def change
    add_column :prelaunches, :site, :string
  end
end
