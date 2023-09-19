class CreateProperty < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :property_type, null: false
      t.boolean :required, default: false

      t.timestamps
    end

    add_index :properties, [:project_id, :name], unique: true
  end
end
