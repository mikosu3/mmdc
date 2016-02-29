class RemoveTicketFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :ticket, :string
  end
end
