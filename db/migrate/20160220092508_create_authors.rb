class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :credit, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.string :twitter
      t.string :pixiv
      t.string :email
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
