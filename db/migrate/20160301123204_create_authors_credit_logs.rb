class CreateAuthorsCreditLogs < ActiveRecord::Migration
  def change
    create_table :authors_credit_logs do |t|
      t.integer :credit_log_id
      t.integer :author_id
    end
  end
end
