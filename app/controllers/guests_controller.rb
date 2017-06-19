class GuestsController < ApplicationController
before_action :authenticated

  def index
    @guests = Guest.all
  end

  def show
    @guest=Guest.find(params[:id])
  end

end
