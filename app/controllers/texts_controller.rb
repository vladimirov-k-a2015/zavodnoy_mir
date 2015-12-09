class TextsController < ApplicationController

	before_filter :find_text,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]


	def index
		@texts = Text.all
		# render text: @texts.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@text = Text.new
	end

	def edit
	    # @text = Text.find(params[:id])	
	end

	def create #C
		# render text: params.inspect
		@text = Text.create(text_params)
		if @text.errors.empty?
			redirect_to text_path(@text)
		else
			render "new"
		end
	end

	def show #R
		unless @text #= Text.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @text = Text.find_by_id(params[:id])
		@text.update_attributes(text_params)
		if @text.errors.empty?
			redirect_to text_path(@text)
		else
			render "edit"
		end
	end

	def destroy #D
		# @text = Text.find(params[:id])
		@text.destroy
		redirect_to action: "index"
	end

	private 

	def text_params
		params.require(:text).permit(:post)
	end

	def find_text
		@text = Text.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
