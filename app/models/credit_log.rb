class CreditLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit
  has_and_belongs_to_many :authors
end

# == Schema Information
#
# Table name: credit_logs
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  credit_id    :integer
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#  distribution :string(255)
#  url          :string(255)
#
# Indexes
#
#  index_credit_logs_on_author_id  (author_id)
#  index_credit_logs_on_credit_id  (credit_id)
#  index_credit_logs_on_user_id    (user_id)
#
