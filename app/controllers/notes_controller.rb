class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit destroy update]

  def index
    @notes = Note.all
  end

  def show; end

  def new
    @note = Note.new
  end

  def multiple_new
    10.times { Note.create(title: "Sample Title", body: "Lorem ipsum ...") }
    redirect_to_root
  end

  def edit; end

  def update
    if @note.update(note_params)
      redirect_to_root
    else
      render "edit"
    end
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to_root
    else
      render "new"
    end
  end

  def destroy
    @note.destroy
    redirect_to_root
  end

  def destroy_all
    @note = Note.all
    @note.destroy_all
    redirect_to_root
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def redirect_to_root
    redirect_to notes_path
  end
end
