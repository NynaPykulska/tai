require_relative '../../lib/last_fm_client'

class HomepageController < ApplicationController

	def index
		@lastfm = LastFMClient.new
		@friends = @lastfm.lastfm.user.get_friends(:user => "genuyalnyul")
		@token = @lastfm.lastfm.auth.get_token
		@comments = Array.new
		for i in 1..3 do
			@comments.push("Comment comment comment comment comment comment comment comment comment comment comment comment comment comment comment comment")
		end
	end

	def addComment(comment)
		@comments.push(comment)
	end
end