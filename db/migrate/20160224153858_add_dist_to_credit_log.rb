class AddDistToCreditLog < ActiveRecord::Migration
  def change
    add_column :credit_logs, :distribution, :string
    add_column :credit_logs, :url, :string
  end
end
