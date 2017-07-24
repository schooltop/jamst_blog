class Article < ApplicationRecord

  has_many :attachments, as: :attachment_entity
  belongs_to :category
  belongs_to :user

  def user_name
    self.user ? user.name : "jamst"
  end

  def cover_img_path
  	self.cover_img ? Attachment.find(self.cover_img.to_i).path.url : ""
  end

  def self.view_count_top
    order(view_count: :desc).limit(5)
  end

end
