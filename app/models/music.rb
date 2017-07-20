class Music < ApplicationRecord
  belongs_to :category	
  has_many :attachments, as: :attachment_entity
end
