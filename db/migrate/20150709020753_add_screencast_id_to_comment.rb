class AddScreencastIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :screencast_id, :integer
  end
end
