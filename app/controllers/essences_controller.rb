class EssencesController < ApplicationController
	before_filter :find_essence,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]


	def index
		@essences = Essence.all
		# render text: @essences.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@essence = Essence.new
	end

	def edit
	    # @essence = Essence.find(params[:id])	
	end

	def create #C
		# render text: params.inspect
		@essence = Essence.create(essence_params)
		if @essence.errors.empty?
			redirect_to essence_path(@essence)
		else
			render "new"
		end
	end

	def show #R
		unless @essence #= Essence.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @essence = Essence.find_by_id(params[:id])
		@essence.update_attributes(essence_params)
		if @essence.errors.empty?
			redirect_to essence_path(@essence)
		else
			render "edit"
		end
	end

	def destroy #D
		# @essence = Essence.find(params[:id])
		@essence.destroy
		redirect_to action: "index"
	end

	private 

	def essence_params
		params.require(:essence).permit(:name, :description, :image_url, :links)
	end

	def find_essence
		@essence = Essence.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
