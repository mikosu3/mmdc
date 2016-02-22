class Video < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  has_many :emm
end
