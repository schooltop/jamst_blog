class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
        t.string   "first_name"
        t.string   "last_name"
        t.string   "name"
	    t.string   "email",                  default: "",    null: false
	    t.string   "mobile"
	    t.string   "telephone"
	    t.string   "encrypted_password",     default: "",    null: false
	    t.string   "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.integer  "sign_in_count",          default: 0,     null: false
	    t.datetime "current_sign_in_at"
	    t.datetime "last_sign_in_at"
	    t.string   "current_sign_in_ip"
	    t.string   "last_sign_in_ip"
	    t.boolean  "is_valid",               default: true
	    t.integer  "state"
	    t.timestamps
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
