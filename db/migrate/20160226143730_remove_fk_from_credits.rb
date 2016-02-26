class RemoveFkFromCredits < ActiveRecord::Migration
  def change
    add_foreign_key :credit_logs, :credits, dependent: :destroy
  end
end
