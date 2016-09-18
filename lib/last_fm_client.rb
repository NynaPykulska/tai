require 'lastfm'
require_relative 'API_Keys' #tutaj trzymam swoje klucze

class LastFMClient
  attr_reader :lastfm
  @lastfm

  def initialize
    api = API_Keys.new
    @lastfm = Lastfm.new(api.key, api.secret)
  end

  def getFriendTracks(friend)
    result = @lastfm.user.get_recent_tracks(:user => friend.to_s, :limit => 11)
    if result.count.even?
      return result
    else
      return @lastfm.user.get_recent_tracks(:user => friend.to_s, :limit => 12)
    end

  end


end