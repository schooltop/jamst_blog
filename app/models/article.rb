class Article < ApplicationRecord

  has_many :attachments, as: :attachment

  def attachment_paths
    self.attachments.map{|attachment|  attachment.attachment_path }
  end

  def attachment_path
    if self.attachments.present?
      return self.attachments.to_arry.last.attachment_path
    end
    nil
  end

  def attachment_name
    if self.attachments.present?
      return self.attachments.to_arry.last.name
    end  
    nil
  end

end
