class BooksController < ApplicationController
	before_filter :find_book,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]


	def index
		@books = Book.all
		# render text: @books.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@book = Book.new
	end

	def edit
	    # @book = Book.find(params[:id])	
	end

	def create #C
		# render text: params.inspect
		@book = Book.create(book_params)
		if @book.errors.empty?
			redirect_to book_path(@book)
		else
			render "new"
		end
	end

	def show #R
		unless @book #= Book.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @book = Book.find_by_id(params[:id])
		@book.update_attributes(book_params)
		if @book.errors.empty?
			redirect_to book_path(@book)
		else
			render "edit"
		end
	end

	def destroy #D
		# @book = Book.find(params[:id])
		@book.destroy
		redirect_to action: "index"
	end

	private 

	def book_params
		params.require(:book).permit(:name, :price, :author, :year, :country, :publishing_house, 
			                         :illustrator, :description, :genre, :size, :weight, :cover, 
			                         :condition, :on_hand, :for_sale, :image_url, :note)
	end

	def find_book
		@book = Book.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
