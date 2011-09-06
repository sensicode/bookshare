class AddUnbannedByToBans < ActiveRecord::Migration
  def self.up
    add_column :bans, :unbanned_by, :integer
    rename_column :bans, :admin_id, :banned_by
  end

  def self.down
    rename_column :bans, :banned_by, :admin_id
    remove_column :bans, :unbanned_by
  end
end
