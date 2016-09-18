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
			@friends = @lastfm.lastfm.user.get_friends(:user => @name)
		end
	end
end