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

  def edit
    @material = Material.find(params[:id])
    unless @material.user == current_user
      redirect_to root_path
    end
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to homes_path
  end

  def download
    @material = Material.find(params[:id])
    filepath = @material.data.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @material.data_identifier, :length => stat.size)
  end

  private
  
  def material_params
    params.require(:material).permit(:title, :content, :school_category_id, :subject_id, :grade_id, :data).merge(user_id: current_user.id)
  end
  
end