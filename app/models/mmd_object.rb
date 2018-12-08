class MmdObject < ActiveRecord::Base
  belongs_to :emm
end

# == Schema Information
#
# Table name: mmd_objects
#
#  id           :integer          not null, primary key
#  extension    :string(10)       not null
#  file_name    :string(200)      not null
#  folder_name  :string(200)      not null
#  full_path    :string(255)      not null
#  lock_version :integer
#  emm_id       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_mmd_objects_on_emm_id                                   (emm_id)
#  index_mmd_objects_on_file_name_and_folder_name_and_extension  (file_name,folder_name,extension)
#
