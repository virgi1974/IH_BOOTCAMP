class AddConcertToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :concert, index: true
  end
end
