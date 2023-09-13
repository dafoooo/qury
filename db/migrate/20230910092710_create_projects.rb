class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :key
      t.text :description

      t.timestamps
    end
    add_index :projects, :key, unique: true
  end
end
