class Person < ActiveRecord::Base
  has_many :participations
  has_many :projects, through: :participations

  def select_not_associatted_projects
    Project.all.select do |project|
    !self.projects.find_by(id: project.id)
    end
  end
end
