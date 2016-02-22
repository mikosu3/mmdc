class Emm < ActiveRecord::Base
  belongs_to :video
  has_many :mmd_object
end
