class CreateTopicGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_groups do |t|
      t.references :project, null: false, foreign_key: true
      t.references :m_color, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
    add_index :topic_groups, :name, unique: true
  end
end
