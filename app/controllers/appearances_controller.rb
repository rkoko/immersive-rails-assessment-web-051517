class AppearancesController < ApplicationController
before_action :authenticated, except: [:show]
  def index
    @appearances = Appearance.all
  end

  def new
    @appearance=Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to appearance_path(@appearance)
    else
      render 'new'
    end
  end

  def show
    @appearance=current_appearance
  end

  def edit
    @appearance=current_appearance
  end

  def update
    @appearance=current_appearance
    if @appearance.update(appearance_params)
      redirect_to appearance_path(@appearance)
    else
      render 'edit'
    end
  end

  def destroy
    @appearance=current_appearance
    @appearance.destroy
    redirect_to new_appearance_path
  end

  private

  def current_appearance
    Appearance.find(params[:id])
  end

  def appearance_params
    params.require(:appearance).permit(:rating, :guest_id, :episode_id)
  end

end
