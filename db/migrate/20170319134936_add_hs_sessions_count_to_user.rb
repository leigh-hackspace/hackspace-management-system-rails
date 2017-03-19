class AddHsSessionsCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :hs_sessions_count, :integer
  end
end
