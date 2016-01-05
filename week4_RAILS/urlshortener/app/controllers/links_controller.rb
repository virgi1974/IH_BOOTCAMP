require 'pry'
class LinksController < ApplicationController
  def index
  end

  def create
    if Link.check_already_exist(params[:link][:long]) == false
      flash[:alert] = "Error, URL already created"
      @short_link = Link.find_by(longlink: params[:link][:long]).shortlink 
      render 'index'
    else
      Link.create_url(params[:link][:long])
      flash[:notice] = "URL created"  
      redirect_to("/links")
    end 
  end

  def show
    route = Link.show_url(params[:number]) 
    redirect_to("#{route}")
  end

  def most_visited_pages
    @links_most_visited = Link.find_most(10)
    render 'most_visited_pages'
  end

  def visited_pages
    @visited_pages = Link.all
    render 'visited_pages'
  end
end


