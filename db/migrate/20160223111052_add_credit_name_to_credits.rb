class AddCreditNameToCredits < ActiveRecord::Migration
  def change
    add_reference  :credits, :author, index: true, foreign_key: true
    add_column :credits, :name, :string
    add_column :credits, :url, :string
  end
end
