require 'lastfm'
require_relative 'API_Keys' #tutaj trzymam swoje klucze

api = API_Keys.new

lastfm = Lastfm.new(api.key, api.secret)

lastfm.user.get_friends(:user => "genuyalnyul").each do |x|
  puts x["name"]
end
