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

  def addComment()
    session[:return_to] ||= request.referer
    artist = params[:artist]
    comment = params[:comment]
    title = params[:title]
    current_user = session[:name]
    Comment.create(artist: artist, title: title, comment: comment, author:current_user)
    redirect_to session.delete(:return_to)
  end


end
