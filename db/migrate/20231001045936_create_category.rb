class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :project, null: false, foreign_key: true
      t.references :m_color, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
