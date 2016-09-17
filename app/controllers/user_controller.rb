require_relative '../../lib/last_fm_client'

class UserController < ApplicationController
  def index
    @name = params[:name]
    @lastfm = LastFMClient.new

    begin
      @user = @lastfm.lastfm.user.get_info(:user => @name)
      @tracks = @lastfm.getFriendTracks(@name)
    rescue
      render "error/user"
    end

    @comments = Array.new
    for i in 1..3 do
      @comments.push("Comment comment comment comment comment comment comment comment comment comment comment comment comment comment comment comment")
    end

  end
end
