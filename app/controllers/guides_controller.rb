class GuidesController < ApplicationController
  has_attached_file :photo, :styles => { :thumb => "250x150>", :medium => "300x300>" },
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"], message: "Only jpeg, and png images types are allowed",
  # validates_attachment_size :photo, :less_than => 5.megabytes

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
