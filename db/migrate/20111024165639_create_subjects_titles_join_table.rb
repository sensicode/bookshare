class CreateSubjectsTitlesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :subjects_titles, :id => false do |t|
      t.integer :subject_id
      t.integer :title_id
    end
    remove_column :titles, :subject_id
  end

  def self.down
    drop_table :subjects_titles
    add_column :titles, :subject_id, :integer
  end
end
