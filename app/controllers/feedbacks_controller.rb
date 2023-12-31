class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.page(params[:page]).per(5)
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
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
    flash[:alert] = 'Feedback deleted'
    redirect_to feedbacks_path
  end

  def feedback_params
    params.require(:feedback).permit(:name, :message, :remarks)
  end
end

