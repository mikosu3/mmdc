class CreateCreditsAuthors < ActiveRecord::Migration
  def change
    create_table :credits_authors do |t|
      t.integer :credit_id
      t.integer :author_id
    end
  end
end
