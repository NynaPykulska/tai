require_relative '../../lib/last_fm_client'

class HomepageController < ApplicationController

	def index
		@lastfm = LastFMClient.new
		@token = session[:token]

		if session[:token].eql? nil
			render "error/login"
		else
			@name = session[:name]
			@user = @lastfm.lastfm.user.get_info(:user => @name)
			begin
				@friends = @lastfm.lastfm.user.get_friends(:user => @name)
			rescue
				@friends = Array.new
				@message = "You got no friends here"
			end
		end
	end
end