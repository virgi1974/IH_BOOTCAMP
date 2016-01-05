require 'pry'
class Project < ActiveRecord::Base

  validates :name, uniqueness: true,presence: true,length: { maximum: 30 }
  validates :name, format: {with: /\A[a-zA-ZÑñ0-9]+\z/}

  has_many :entries
  has_many :participations
  has_many :people, through: :participations


  def self.iron_find params
    Project.first(params)
  end

  def self.iron_find2 params
    if where(params)
      where(params)
    else
      "error"
    end
  end

  def self.clean_old 
    where('created_at < ?', Date.yesterday-7).destroy_all
  end

  def self.last_created_projects num
    order(created_at: :desc).limit(num)
  end

  def self.first_created_projects num
    order(created_at: :asc).limit(num)
  end

  def total_hours_in_month(month,year) 

    date_start = Date.new(year,month,1)
    date_end = Date.new(year,month,-1)
    selected_entries = self.entries.where(date: date_start..date_end)

    total_minutes = selected_entries.reduce(0) do |sum,entry|
      sum + entry.minutes + entry.hours*60.0
    end

    return total_minutes/60
  end



end







