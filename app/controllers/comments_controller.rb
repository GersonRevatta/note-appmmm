# CommentsController
class CommentsController < ApplicationController
  before_action :find_note

  def create
    @comment = @note.comments.new(comment_params)
    return redirect_to @note if @comment.save
  end

  private

  def find_note
    @note = Note.find(params[:note_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :note_id)
  end
end
