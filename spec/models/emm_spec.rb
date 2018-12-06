require 'rails_helper'

RSpec.describe Emm, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: emms
#
#  id             :integer          not null, primary key
#  original_name  :string(255)      not null
#  save_file_name :string(255)      not null
#  lock_version   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  video_id       :integer
#
