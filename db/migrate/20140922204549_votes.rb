class Votes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :song
      t.belongs_to :user
      t.timestamps

    end
    add_index :votes, [:user_id, :song_id], :unique => true
  end
end
