class CreateCreditLogs < ActiveRecord::Migration
  def change
    create_table :credit_logs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :credit, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
