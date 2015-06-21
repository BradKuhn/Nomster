class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		@places = Place.all.order("name").page(params[:page]).per(10)
	end

	def new
		@place = Place.new
	end

	def create
  		@place = current_user.places.create(place_params)
  		if @place.valid?
    		redirect_to root_path
  		else
    		render :new, :status => :unprocessable_entity
  		end
	end

	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
	end
	
	def edit
		@place = Place.find(params[:id])

		verify_correct_user
	end

	def update
		@place = Place.find(params[:id])

		verify_correct_user

		@place.update_attributes(place_params)
  		if @place.valid?
    		redirect_to root_path
  		else
    		render :edit, :status => :unprocessable_entity
  		end
	end

	def destroy
		@place = Place.find(params[:id])
		verify_correct_user

		@place.destroy
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end

end
