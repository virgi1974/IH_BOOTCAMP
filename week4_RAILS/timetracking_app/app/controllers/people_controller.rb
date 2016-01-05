class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
    render 'new'
  end

  def create
    @person = Person.new(entry_params) 
    if @person.save
      redirect_to action: 'index', controller: 'people'
    else
      render 'new'
    end
  end

  def show
    @person = Person.find_by(id: params[:id])
    @projects_not_associated = @person.select_not_associatted_projects 
  end

  def update
    @project = Project.find(params[:person][:projects])
    @person = Person.find(params[:id])

    @person.projects << @project
    redirect_to action: 'show', controller: 'people'
  end

  private
  def entry_params
    params.require(:person).permit(:name)
  end

end
