class CreateBans < ActiveRecord::Migration
  def self.up
    create_table :bans do |t|
      t.datetime  :unbanned_at
      t.integer   :user_id
      t.integer   :admin_id
      t.text      :reason
      t.timestamps
    end
  end

  def self.down
    drop_table :bans
  end
end
