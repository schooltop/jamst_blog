class AddViewCountToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles ,:view_count, :integer, comment: '文章访问次数' 
  	add_column :articles ,:seq, :integer, default: 10, comment: '顺序' 
  	add_column :articles ,:cover_img, :string, comment: '封面' 
  end
end
