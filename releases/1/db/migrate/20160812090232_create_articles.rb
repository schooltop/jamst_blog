class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer  "state"
	    t.references :category
	    t.references :user
	    t.string   "title"
	    t.text   "content"
      t.timestamps
    end
  end
end
