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

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(params.require(:note).permit(:title, :body))
    @note.save
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    @note = Note.all
    @note.destroy_all

    # respond_to do |format|
    #   format.html { redirect_to notes_path, notice: 'page was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def article_params
    params.require(:note).permit(:title, :body)
  end
end
