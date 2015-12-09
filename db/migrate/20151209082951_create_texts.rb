class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.string :post
      t.timestamps null: false
    end
  end
end
