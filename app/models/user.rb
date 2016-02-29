class User < ActiveRecord::Base
has_many :products
before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
has_attached_file :image
 validates_attachment :image, presence: true,
                     size: { in: 0..5000.kilobytes }
do_not_validate_attachment_file_type :image		 
end
