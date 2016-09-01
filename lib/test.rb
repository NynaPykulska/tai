
require_relative 'last_fm_client'

client = LastFMClient.new

# client.lastfm.user.get_friends(:user => "genuyalnyul").each do |x|
#   puts x["name"]
# end

puts tmp = client.lastfm.user.get_friends(:user => "genuyalnyul")
tmp.each do |friend|
  puts client.getFriendTracks(friend["name"])
end


# client.lastfm.user.get_recent_tracks(:user => "genuyalnyul", :limit => 10).each do |track|
#   puts track["name"]
# end