class ScreencastsController < ApplicationController
	def index
		desiredScreencast = params[:desiredScreencast].present? ? params[:desiredScreencast] : 10
		start = params[:start].present? ? params[:start] : 0
		render json: Screencast.limit(desiredScreencast).offset(start)
	end

	def show
		render json: Screencast.find(params[:id]).as_json()
	end

end
