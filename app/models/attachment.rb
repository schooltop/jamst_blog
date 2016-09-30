class Attachment < ApplicationRecord

  belongs_to :attachment, polymorphic: true

  before_save :set_fields
  
  # column_name 当一个
  attr_accessible :attachment_file, :file_name,:content_type,:path, :name, :file_size, :attachment_type,:column_name
  attr_accessor :attachment_file,:file_name,:content_type,:column_name

  def set_fields
    original_filename = file_name.present? ? file_name : attachment_file.original_filename
    ext = File.extname(original_filename) 
    self.path =  file_name.present? ? file_name : "#{SecureRandom.uuid}#{ext}"
    self.column_name =  column_name.present? ? column_name : "path"
    self.content_type = content_type.present? ? content_type : attachment_file.content_type
    self.file_size = file_name.present? ? attachment_file.size : attachment_file.size
    self.name = original_filename
  end

  def store_dir
    "uploads/#{self.attachment_type.to_s.underscore}/path/#{WhUtils.split_id(self.attachment_id,false)}"
  end

  def attachment_path
    mongo_server = "#{MONGO_ATTACHMENT_SERVER['scheme']}://#{MONGO_ATTACHMENT_SERVER['host']}:#{MONGO_ATTACHMENT_SERVER['port']}"
    return "#{mongo_server}/#{store_dir}/#{self.path}"
  end

end