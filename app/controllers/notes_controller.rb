# NotesController
class NotesController < ApplicationController
  before_action :find_note, only: %i[edit update show destroy]
  def index
    @notes = Note.all.order('created_at DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
