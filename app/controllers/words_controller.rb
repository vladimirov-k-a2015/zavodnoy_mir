class WordsController < ApplicationController
	
	before_filter :find_item,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]


	def index
		@words = Word.all
		# render text: @words.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@word = Word.new
	end

	def edit
	    # @word = Word.find(params[:id])	
	end

	def create #C
		# render text: params.inspect
		@word = Word.create(word_params)
		if @word.errors.empty?
			redirect_to word_path(@word)
		else
			render "new"
		end
	end

	def show #R
		unless @word #= Word.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @word = Word.find_by_id(params[:id])
		@word.update_attributes(word_params)
		if @word.errors.empty?
			redirect_to word_path(@word)
		else
			render "edit"
		end
	end

	def destroy #D
		# @word = Word.find(params[:id])
		@word.destroy
		redirect_to action: "index"
	end

	private 

	def word_params
		params.require(:word).permit(:russian, :greek, :latin, :english, :french, :german, :dutch, :spanish, :italian, :hungarian, :croatian, :chance)
	end

	def find_item
		@word = Word.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
