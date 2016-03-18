class Product < ActiveRecord::Base
   belongs_to :category
   belongs_to :user
   has_many :comments, dependent: :destroy
   validates_presence_of :name

has_attached_file :image
validates_attachment :image, presence: true,
                     size: { in: 0..10000.kilobytes }
do_not_validate_attachment_file_type :image	

has_attached_file :audio  ,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/m4a', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

end
