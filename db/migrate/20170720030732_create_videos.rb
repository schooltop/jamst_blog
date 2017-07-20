class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string  :name
      t.references :category
      t.integer :view_count , comment: '访问次数'
      t.text    :content
      t.timestamps	
    end
  end
end
