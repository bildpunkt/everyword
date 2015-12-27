#!/usr/bin/env ruby
require "rio"
require "twitter"
require "yaml"

# Application version
VERSION = "1.0.0"

# Loading configuration
APP_CONFIG = YAML.load_file(File.expand_path("config.yml", File.dirname(__FILE__)))

# Twitter client configuration
client = Twitter::REST::Client.new do |config|
  config.consumer_key = APP_CONFIG['twitter']['consumer_key']
  config.consumer_secret = APP_CONFIG['twitter']['consumer_secret']
  config.access_token = APP_CONFIG['twitter']['access_token']
  config.access_token_secret = APP_CONFIG['twitter']['access_token_secret']
end

# Index functions
def get_index(file)
  rio(file).contents.to_i
end

def set_index(file, index)
  rio(file).print! index.to_s
end

# Source functions
def get_line(file, index)
  rio(file).lines[index][0].chomp("\n")
end

def get_line_count(file)
  rio(file).lines.count
end

# Important variable
$index = get_index("index.txt")

puts "everyword v#{VERSION} by pixeldesu"
puts "------------------------------"
puts "[source] Includes #{get_line_count("source.txt")} words"
puts "[index] Currently at index #{$index}"
puts "------------------------------"

loop do
  client.update get_line("source.txt", $index)
  $index += 1
  set_index("index.txt", $index)
  sleep 30 * 60
end
