class AddVotesToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :votes, :integer
  end
end
