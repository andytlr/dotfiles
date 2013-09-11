# ruby ~/.dotfiles/andy/open-in-github-pulls.rb

require 'launchy'

path   = Dir.pwd
pulls  = "http://github.com/" + path.gsub("/Users/andytlr/", "").downcase + "/pulls"
Launchy.open(pulls)
