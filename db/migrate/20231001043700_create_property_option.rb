class CreatePropertyOption < ActiveRecord::Migration[7.0]
  def change
    create_table :property_options do |t|
      t.references :property, null: false, foreign_key: true
      t.references :m_color, null: false, foreign_key: true
      t.string :value
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
