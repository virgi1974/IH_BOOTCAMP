require 'pry'
class EntriesController < ApplicationController

  def index
    @project = Project.find_by(params[:project_id])
    @entries = Project.find(params[:project_id]).entries
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new 
  end

  def create

    @project = Project.find(params[:project_id]) 
    @entry = @project.entries.new(entry_params) #STRONG PARAMS

    if @entry.save
      flash[:notice] = 'Entry created successfully!'
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      flash[:alert] = 'Entry creation failed!'
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
      @project = Project.find(params[:project_id])
      @entry = @project.entries.find(params[:id])
      
    if @entry.update_attributes(entry_params)
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    @entry.destroy
    redirect_to action: 'index', controller: 'entries'
  end

  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
