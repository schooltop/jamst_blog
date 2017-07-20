class AddMusicIdToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles ,:music_id, :integer, comment: '关联音乐' 
  	add_column :articles ,:video_id, :integer, comment: '关联视频' 
  end
end
