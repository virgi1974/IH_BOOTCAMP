require 'pry'
class Concert < ActiveRecord::Base

  validates :band, :venue, :city, :date, :price, :description, presence: true
  validates :price, numericality: true
  
  has_many :comments

  # has_many :participations
  # has_many :users, through: :participations

  def self.today_concert
    concert = Concert.where(date: Date.today.beginning_of_day..Date.today.end_of_day)
  end

  def self.month_concerts
    concert = Concert.where(date: Date.current.tomorrow..Date.today >> 1)
  end


end
