class RenameBannedByAndUnBannedByInBans < ActiveRecord::Migration
  def self.up
    rename_column :bans, :banned_by, :banner
    rename_column :bans, :unbanned_by, :unbanner
  end

  def self.down
    rename_column :bans, :banner, :banned_by
    rename_column :bans, :unbanner, :unbanned_by
  end
end
