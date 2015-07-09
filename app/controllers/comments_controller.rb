class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  end

	def create
		@comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :ok
    else
      render json: {comment: @comment.errors, status: :no_content}
    end
	end

	private
  def comment_params
      h = params.require(:comment).permit(:name, :content)
      h.merge!(screencast_id: params[:id])
  end
end
