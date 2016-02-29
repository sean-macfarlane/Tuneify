class Product < ActiveRecord::Base

	belongs_to :category
	validates_presence_of :name
	
	has_attached_file :audio  

validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/m4a', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]

end
