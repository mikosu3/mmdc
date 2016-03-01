class DropTableCreditsAuthors < ActiveRecord::Migration
  def change
    drop_table :credits_authors
  end
end
