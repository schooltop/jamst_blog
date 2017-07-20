class CreateEntityTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entity_tags do |t|
      t.string "entity_tag_type", limit: 64
      t.integer "entity_tag_id"	
      t.references :tag
      t.integer  "state"
      t.timestamps	
    end
  end
end
