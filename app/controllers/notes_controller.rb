class NotesController < ApplicationController
  before_action :set_feedback
  before_action :set_note, only: [:edit, :update, :destroy]

  def index
    @notes = @feedback.notes
  end

  def new
    @note = @feedback.notes.build
  end

  def create
    @note = @feedback.notes.build(note_params)
    if @note.save
      flash[:notice] = 'Comment created successfully'
      redirect_to feedback_notes_path(@feedback)
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @note.update(note_params)
      flash[:notice] = 'Note updated successfully'
      redirect_to post_notes_path(@feedback)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = 'Note deleted successfully'
    redirect_to feedback_notes_path(@feedback)
  end

  private

  def set_feedback
    @feedback = Feedback.find params[:feedback_id]
  end

  def note_params
    params.require(:note).permit(:content)
  end

  def set_comment
    @note = @feedback.notes.find(params[:id])
  end
end

