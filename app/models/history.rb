class History < ActiveRecord::Base
end

# == Schema Information
#
# Table name: histories
#
#  id         :integer          not null, primary key
#  link       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item       :string(255)
#  item_name  :string(255)
#  is_create  :boolean          default(TRUE), not null
#
