require_relative '../../lib/last_fm_client'

class HomepageController < ApplicationController

	def index
		@lastfm = LastFMClient.new
		@friends = @lastfm.lastfm.user.get_friends(:user => "rozowy_krolik")
		puts "omg"
	end

	def get_comments(artist, title) 
		data = Comment.where(artist: artist, title: title)
		puts data
		puts "data"
		return data
	end

	def get_comments_number(artist, title)
		return Comment.where(artist: artist, title: title).length
	end

	helper_method :get_comments_number
	helper_method :get_comments
end