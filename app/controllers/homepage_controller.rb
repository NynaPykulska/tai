require_relative '../../lib/last_fm_client'

class HomepageController < ApplicationController

	def index
		lastfm = LastFMClient.new
		@friends = lastfm.lastfm.user.get_friends(:user => "genuyalnyul")
		p @friends[0]["name"]
	end
end