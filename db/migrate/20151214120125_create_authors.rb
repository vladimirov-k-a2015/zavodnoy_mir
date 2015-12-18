class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
    	t.string :name
    	t.string :country
    	t.string :years
    	t.string :note
      t.timestamps null: false
    end
  end
end
