class VideosController < ApplicationController
  def show
  	@video = Video.find_by_slug(params[:slug])
  end
end
