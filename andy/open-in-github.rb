# ruby ~/.dotfiles/andy/open-in-github.rb

require 'launchy'

path   = Dir.pwd
repo   = "http://github.com/" + path.gsub("/Users/andytlr/", "").downcase
Launchy.open(repo)
