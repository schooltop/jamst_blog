class User < ApplicationRecord
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to :tag   

    def is_active?
	  self.state.to_i == 1
	end
 
end
