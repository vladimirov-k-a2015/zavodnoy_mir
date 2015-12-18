class Book < ActiveRecord::Base

	belongs_to :author


	private
	def book_params
		params.require(:book).permit(:author, :name, :price, :year, :country,
		 :publishing_house, :illustrator, :description, :genre, :size, :weight, :cover, :condition,
		 :on_hand, :for_sale, :image_url, :note)
	end
end

 