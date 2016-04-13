class Image < ActiveRecord::Base
    belongs_to :product

  has_attached_file :photo, :styles => { :small => "50x50>", :medium => "300x200>" },
    :url  => "/assets/images/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension",
    :default_url => '/images/missing_photo_:style.png'

    validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
