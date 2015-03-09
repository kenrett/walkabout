class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def new
    @guide = Guide.new
  end

  def create
    redirect_to root_path
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
    params.require(:guides).permit(:title, :description, :price)
  end
end
