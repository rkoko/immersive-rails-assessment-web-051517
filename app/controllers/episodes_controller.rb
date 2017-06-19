class EpisodesController < ApplicationController
before_action :authenticated

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

end
