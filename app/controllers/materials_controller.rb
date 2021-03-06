class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, except: [:index, :new, :create]

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
    @feedback = Feedback.new
    @feedbacks = @material.feedbacks
  end

  def edit
    unless @material.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @material.update(material_params)
      redirect_to material_path(id: @material.id)
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to homes_path
  end

  def download
    data = open(URI.encode(@material.data.url))
      send_data(data.read, disposition: 'attachment', filename: @material[:data])

  end

  private
  
  def material_params
    params.require(:material).permit(:title, :content, :school_category_id, :subject_id, :grade_id, :data, :image).merge(user_id: current_user.id)
  end
  
  def set_material
    @material = Material.find(params[:id])
  end

end