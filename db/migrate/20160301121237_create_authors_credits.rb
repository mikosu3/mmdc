class CreateAuthorsCredits < ActiveRecord::Migration
  def change
    create_table :authors_credits do |t|
      t.integer :credit_id
      t.integer :author_id
    end
  end
end
