class AddDownvotesToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :downvotes, :integer
  end
end
