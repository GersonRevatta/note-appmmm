# CommentsController
class CommentsController < ApplicationController
  before_action :find_note
  before_action :find_comment, only: [:destroy]
  def create
    @comment = @note.comments.new(comment_params)
    return redirect_to @note if @comment.save
  end

  def destroy
    @comment.destroy
    redirect_to @note
  end

  private

  def find_comment
    @comment = @note.comments.find(params[:id])
  end

  def find_note
    @note = Note.find(params[:note_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :note_id)
  end
end
