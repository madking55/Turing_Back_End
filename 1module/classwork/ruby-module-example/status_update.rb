require './commentable'

class StatusUpdate
	include Commentable
	attr_reader :body, :comments

	def initialize(body)
		@body = body
		@comments = {}
	end

	def display
		puts "-" * 50
		puts "STATUS UPDATE"
		puts "Body: #{body}"
		comments.each do |id, text|
			puts "#{id}: #{text}"
		end
		puts "-" * 50
	end
end
