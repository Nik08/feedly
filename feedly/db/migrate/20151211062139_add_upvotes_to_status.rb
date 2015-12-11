class AddUpvotesToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :upvotes, :integer
  end
end
