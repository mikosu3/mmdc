class CreditLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit
  has_and_belongs_to_many :authors
end
