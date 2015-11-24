class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
    	t.string  :russian
    	t.string  :greek
    	t.string  :latin
    	t.string  :english
    	t.string  :french
    	t.string  :german
    	t.string  :dutch
    	t.string  :spanish
    	t.string  :italian
    	t.string  :hungarian
    	t.string  :croatian
    	t.string  :chance

      t.timestamps null: false
    end
  end
end
