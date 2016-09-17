require_relative '../../lib/last_fm_client'

class LoginController < ApplicationController
  def index
    reset_session
    @lastfm = LastFMClient.new
  end

  def auth
    session[:token] = params[:token]
    redirect_to homepage_path
  end

end
