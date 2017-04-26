class V1::CommentsController < ApplicationController

  def create
    event = Event.find_by(id: params["event_id"])
    name = comment_params[:name]
    content = comment_params[:content]
    comment = Comment.create(event: event, name: name, content: content)
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
