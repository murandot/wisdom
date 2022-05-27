class FeedbacksController < ApplicationController
  
  def create
    @feedback = Feedback.new(feedback_params)
    @material = @feedback.material
    @feedbacks = @material.feedbacks
    if @feedback.save
      redirect_to "/materials/#{@feedback.material.id}"
    else
      render "material/show"
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:content).merge(user_id: current_user.id, material_id: params[:material_id])
  end

end
