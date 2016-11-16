require 'net/http'
require 'json'

uri = URI('https://kits-crashlytics-com.s3.amazonaws.com/fastlane/standalone/version.json')
json_string = Net::HTTP.get(uri)
json = JSON.parse(json_string)
available_bundle_version = json["bundle_version"]

path_to_version = File.expand_path(File.join(File.dirname(__FILE__), 'VERSION'))

version_string = File.open(path_to_version) { |file| file.each_line.first }
current_bundle_version = version_string.chomp.to_f

puts "UPDATE FASTLANE" if available_bundle_version > current_bundle_version
