class Credit < ActiveRecord::Base
  belongs_to :wanted
  has_many :author
end
