class Entry < ActiveRecord::Base

  validates :hours, numericality: true, presence: true
  validates :minutes, numericality: true, presence: true 
  validates :date,presence: true

  validates :project_id,presence: true, numericality: true

  belongs_to :project


end
