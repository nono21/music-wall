class AddSongs < ActiveRecord::Migration
  def change

    create_table :songs do |t|
    t.belongs_to :user
    t.string :url
    t.string :author
    t.string :song_title
    t.timestamps
    end
  end
 
end
