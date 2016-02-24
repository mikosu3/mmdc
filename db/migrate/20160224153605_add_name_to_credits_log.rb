class AddNameToCreditsLog < ActiveRecord::Migration
  def change
    add_column :credit_logs, :name, :string
  end
end
