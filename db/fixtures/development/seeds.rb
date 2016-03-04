# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:is_admin => false, :screen_name => "mikosu3b",  :uid => "3aaa416", :provider => "twitter", :name => "みこすb")
User.create(:is_admin => false, :screen_name => "mikosu3c",  :uid => "322b416", :provider => "twitter", :name => "みこすc")
