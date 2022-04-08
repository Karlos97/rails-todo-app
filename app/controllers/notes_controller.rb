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
    redirectToRoot
  end

  def edit; end

  def update
    @note.update(note_params)
    redirectToRoot
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirectToRoot
  end

  def destroy
    @note.destroy
    redirectToRoot
  end

  def destroy_all
    @note = Note.all
    @note.destroy_all
    redirectToRoot
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def redirectToRoot
    redirect_to notes_path
  end
end
