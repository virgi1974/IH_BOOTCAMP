require 'pry'
class ProjectsController < ApplicationController
  
  def index
    @projects = Project.first_created_projects(10) 
    if @projects.empty?
       render template: 'templates/no_projects' 
    end
  end

  def show
    @project = Project.find_by(id: params[:id]) || render_404(params)
  end
  
end
