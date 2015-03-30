class GuidesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @guides = Guide.all
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)

    if @guide.save
      redirect_to root_path
    else
      flash.now[:alert] = @guide.errors.full_messages.first
      render :new
    end
  end

  def edit

  end

  def update
    @guide = Guide.find(guide_params)

    if @guide.update_attributes(guide_params)
        flash[:notice] = "Success"
        redirect_to guides_path(@guide)
      else
        flash.now[:alert] = @guide.errors.full_messages.first
        render :edit
    end
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :description, :price, :photo)
  end
end
