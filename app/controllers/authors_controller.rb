class AuthorsController < ApplicationController

	before_filter :find_author,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]



	def index
		@authors = Author.all
		# render text: @authors.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@author = Author.new
	end

	def edit
	    # @author = Author.find(params[:id])	
	end

	def create

		@author = Author.new(author_params)

		respond_to do |format|
	      if @author.save
	        format.html { redirect_to @author, notice: 'Author was successfully created.' }
	        # format.json { render :show, status: :created, location: @author }
	        # format.json { render @author.to_json, status: :created }
	        format.json  { render :json => @author }

	      else
	        format.html { render :new }
	        format.json { render json: @author.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show #R
		unless @author #= Author.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @author = Author.find_by_id(params[:id])
		@author.update_attributes(author_params)
		if @author.errors.empty?
			redirect_to author_path(@author)
		else
			render "edit"
		end
	end

	def destroy #D
		# @author = Author.find(params[:id])
		@author.destroy
		redirect_to action: "index"
	end

	private 

	def author_params
		params.require(:author).permit(:name, :country, :years, :note)
	end

	def find_author
		@author = Author.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
