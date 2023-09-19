class CreateMColor < ActiveRecord::Migration[7.0]
  def change
    create_table :m_colors do |t|
      t.string :key, unique: true, null: false, index: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
