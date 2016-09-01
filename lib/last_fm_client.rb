require 'lastfm'
require_relative 'API_Keys' #tutaj trzymam swoje klucze

class LastFMClient
  attr_reader :lastfm
  @lastfm

  def initialize
    api = API_Keys.new
    @lastfm = Lastfm.new(api.key, api.secret)
  end

  def test
    @lastfm.user.get_friends(:user => "genuyalnyul").each do |x|
      puts x["name"]
    end
  end

end