class AddShortlinkToLinks < ActiveRecord::Migration
  def change
    add_column :links, :shortlink, :string
  end
end
