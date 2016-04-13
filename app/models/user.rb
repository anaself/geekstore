# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  phone      :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authentifications
  has_many :devices
  has_one :basket
  has_attached_file :photo, :styles => { :small => '50x50>', :medium => '200x200>', :profil => '300x250>' },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension",
                  :default_url => '/images/missing_photo_user_:style.png'
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  after_create :add_basket

  def authenticate?
      User.exists?(email: self.email, password: self.password)
  end

  def add_basket
    self.basket = Basket.new
    self.save
  end
end
