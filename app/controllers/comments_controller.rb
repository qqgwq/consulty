class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @comment = @meeting.comments.create(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to meeting_path(@meeting)}
        format.js
      else
        format.html { redirect_to meeting_path(@meeting), notice: "Your comment did not save, Please try again" }
        format.js
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
     format.html { redirect_to meeting_path(@meeting) }
     format.js
    end
  end

  private

  def set_comment
    @meeting = Meeting.find(params[:meeting_id])
    @comment = @meeting.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
