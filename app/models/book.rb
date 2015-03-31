class Book < ActiveRecord::Base
  has_many :guides

  validates_presence_of :title, :description, :price
  has_attached_file :photo, :styles => { :thumb => "250x150>", :medium => "300x300>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage/
  validates_attachment_file_name :photo, :matches => [/png\Z/i, /jpe?g\Z/i, /gif\Z/i]
  validates_attachment_size :photo, :less_than => 5.megabytes
end
