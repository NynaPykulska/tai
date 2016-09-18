
require_relative 'last_fm_client'

client = LastFMClient.new

# client.lastfm.user.get_friends(:user => "genuyalnyul").each do |x|
#   puts x["name"]
# end

# puts tmp = client.lastfm.user.get_friends(:user => "genuyalnyul")
# tmp.each do |friend|
#   puts client.getFriendTracks(friend["name"])
# end


if client.lastfm.user.get_info(:user => "hfdhfghgfdhgf").to_s.eql? "User not found"
  puts "byl error"
end

begin
  puts client.lastfm.user.get_info(:user => "hfdhfghgfdhgf")
rescue Exception => e
  puts e
end

# client.lastfm.user.get_recent_tracks(:user => "genuyalnyul", :limit => 10).each do |track|
#   puts track["name"]
# end
#
#
# token = client.lastfm.auth.get_token
# puts 'http://www.last.fm/api/auth/?api_key=426dda789364f83ca2d606d558e3f17a&token='+token