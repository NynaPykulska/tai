require_relative '../../lib/last_fm_client'

class UserController < ApplicationController
  def index
    @name = params[:name]
    @lastfm = LastFMClient.new
    @current_user = session[:name]
    if @current_user.eql? nil
      render "error/login"
    else


    begin
      @user = @lastfm.lastfm.user.get_info(:user => @name)
      @tracks = @lastfm.getFriendTracks(@name)
    rescue
      render "error/user"
    end

    @comments = Comment.all

    end

  end

  def searchComments(artist, title)
    comments = @comments.where(artist: artist, title: title)
    return comments
  end
  helper_method :searchComments

  def addComment(comment, artist, title)
    @comments.create(artist: artist, title: title, comment: comment, author: @current_user)
  end
  helper_method :addComment


end
