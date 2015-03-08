class GuidesController < ApplicationController

  def new
    @guide = Guide.new
  end
end
