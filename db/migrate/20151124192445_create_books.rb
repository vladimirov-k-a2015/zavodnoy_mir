class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string   :name
    	t.float    :price
    	t.string   :author
    	t.integer  :year
    	t.string   :country
    	t.string   :publishing_house
    	t.string   :illustrator
    	t.string   :description
    	t.string   :genre
    	t.string   :size
    	t.float    :weight
    	t.string   :cover
    	t.string   :condition
    	t.boolean  :on_hand
    	t.boolean  :for_sale
    	t.string   :image_url
    	t.string   :note

      t.timestamps null: false
    end
  end
end
