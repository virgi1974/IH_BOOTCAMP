class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :project, index: true #para indicar relaciones 1-n
      t.integer :hours
      t.integer :minutes
      t.text :comments
      t.datetime :date
      t.timestamps
    end
  end
end
