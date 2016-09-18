require_relative '../../lib/last_fm_client'

class LoginController < ApplicationController
  def index
    reset_session
    @lastfm = LastFMClient.new
  end

  def auth
    @lastfm = LastFMClient.new
    session[:token] = params[:token]
    session[:name] = @lastfm.lastfm.auth.get_session(token: session[:token])['name']
    redirect_to homepage_path
  end

end
