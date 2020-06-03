require './commentable'

class Photo
	include Commentable 
	attr_reader :image_source, :caption, :comments

	def initialize(image_source, caption)
		@image_source = image_source
		@caption = caption
		@comments = {}
	end

	def display
		puts "-" * 50
		puts "PHOTO"
		puts "URL: #{image_source}"
		puts "Caption: #{caption}"
		comments.each do |id, text|
			puts "#{id}: #{text}"
		end
		puts "-" * 50
	end

end
