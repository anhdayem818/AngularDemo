class ScreencastsController < ApplicationController
	def index
		render json: Screencast.all
	end

	def show
		render json: Screencast.find(params[:id]).as_json()
	end

end
