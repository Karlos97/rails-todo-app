class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit destroy ]

  def index
    @notes = Note.all
  end

  def show
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
  end

  def create
    @note = Note.new(article_params)
    @note.save

    redirect_to notes_path
  end

  def destroy
    @note.destroy

    redirect_to notes_path
  end

  def destroy_all
    @note = Note.all
    @note.destroy_all

    redirect_to notes_path
  end
  
  private
    def article_params
      params.require(:note).permit(:title, :body)
    end

    def set_note
      @note = Note.find(params[:id])
    end
    
end
