class AddColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visited, :visited
  end
end
