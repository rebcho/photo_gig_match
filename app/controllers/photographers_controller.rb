class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.page(params[:page]).per(10)
  end

  def show
    @photographer = Photographer.find(params[:id])
  end
end
