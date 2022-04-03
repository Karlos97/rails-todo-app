class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def multiple_new
    for i in 1..10 do
      @note = Note.new
      @note.title = 'Note number ' + i.to_s
      @note.body = 'Notes body'
      @note.save
    end

    redirect_to notes_path
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params.require(:note).permit(:title, :body))
    @note.save

    redirect_to notes_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end

  def destroy_all
    @note = Note.all
    @note.destroy_all

    redirect_to notes_path
  end

  def article_params
    params.require(:note).permit(:title, :body)
  end
end
