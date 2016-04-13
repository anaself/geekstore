# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  quantity   :float
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  has_and_belongs_to_many :baskets
  has_and_belongs_to_many :categories
  has_many :pictures
  has_many :images
  has_attached_file :photo, :styles => { :small => "90x90>", :medium => "300x200>" },
                    :url  => '/assets/products/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/assets/products/:id/:style/:basename.:extension',
                    :default_url => '/images/missing_photo_:style.png'

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  scope :in_category, -> (category){ joins(:categories).where('categories.id = ?', category.id) }
  scope :in_basket, -> (basket){ joins(:baskets).where('baskets.id = ?', basket.id) }
  validates :name, uniqueness: true, length: { maximum: 30 }

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
