class EventsController < ApplicationController
	before_filter :find_event,      only: [:show, :edit, :update, :destroy]
	# before_filter :check_if_admin, only: [:new, :edit, :create, :update, :destroy]


	def index
		@events = Event.all
		# render text: @events.map { |i| "#{i.russian}: --- #{i.greek} --- #{i.latin} --- #{i.english} --- #{i.french} --- #{i.german} --- #{i.dutch} --- #{i.spanish} --- #{i.italian} --- #{i.hungarian} --- #{i.croatian}  "   }.join("<br/>" )
	end

	def new
		@event = Event.new
	end

	def edit
	    # @event = Event.find(params[:id])	
	end

	def create #C
		# render text: params.inspect
		@event = Event.create(event_params)
		if @event.errors.empty?
			redirect_to event_path(@event)
		else
			render "new"
		end
	end

	def show #R
		unless @event #= Event.where( id: params[:id] ).first
			render text: "Page not found", status: 404
		end
	end

	def update #U
		# @event = Event.find_by_id(params[:id])
		@event.update_attributes(event_params)
		if @event.errors.empty?
			redirect_to event_path(@event)
		else
			render "edit"
		end
	end

	def destroy #D
		# @event = Event.find(params[:id])
		@event.destroy
		redirect_to action: "index"
	end

	private 

	def event_params
		params.require(:event).permit(:year, :description)
	end

	def find_event
		@event = Event.find(params[:id])
	end

	# def check_if_admin
	# 	render text: "Access denied", status: 403 unless params[:admin]
	# end
end
