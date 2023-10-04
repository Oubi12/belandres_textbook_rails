class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:notice] = 'created successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'failed successfully'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(params.require(:feedback).permit(:name, :email, :message, :remarks))
      flash[:notice] = 'feedback updated successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'update failed'
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    flash[:notice] = 'Feedback deleted'
    redirect_to feedbacks_path
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message, :remarks)
  end
end

