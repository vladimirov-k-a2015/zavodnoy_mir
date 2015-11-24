class CreateEssences < ActiveRecord::Migration
  def change
    create_table :essences do |t|
    	 t.string   :name         
         t.string   :description
         t.string   :image_url
         t.string   :links
      t.timestamps null: false
    end
  end
end
