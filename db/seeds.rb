# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:is_admin => true, :screen_name => "mikosu3", :twitter_user_id => 1, :access_token => "", :access_token_secret => "", :ticket => "")
User.create(:is_admin => false, :screen_name => "mikosu3a", :twitter_user_id => 2, :access_token => "", :access_token_secret => "", :ticket => "")
User.create(:is_admin => false, :screen_name => "mikosu3b", :twitter_user_id => 3, :access_token => "", :access_token_secret => "", :ticket => "")


