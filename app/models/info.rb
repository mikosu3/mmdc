class Info < ActiveRecord::Base
end

# == Schema Information
#
# Table name: infos
#
#  id           :integer          not null, primary key
#  date         :date
#  title        :string(255)      not null
#  note         :text(65535)
#  lock_version :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
