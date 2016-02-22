class CreditLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit
  belongs_to :author
end
