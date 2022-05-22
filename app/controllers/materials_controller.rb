class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @materials = Material.all.order('created_at DESC')
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @material = Material.find(params[:id])
  end
     
  private
  
  def material_params
    params.require(:material).permit(:title, :content, :school_category_id, :subject_id, :grade_id).merge(user_id: current_user.id)
  end
  
end