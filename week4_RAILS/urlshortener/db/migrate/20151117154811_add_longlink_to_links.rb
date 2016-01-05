class AddLonglinkToLinks < ActiveRecord::Migration
  def change
    add_column :links, :longlink, :string
  end
end
