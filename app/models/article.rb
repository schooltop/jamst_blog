class Article < ApplicationRecord

  has_many :attachments, as: :attachment_entity
  belongs_to :category


end
