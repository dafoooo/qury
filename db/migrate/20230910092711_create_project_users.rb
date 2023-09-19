class CreateProjectUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.boolean :is_owner, default: false

      t.timestamps
    end

    add_index :project_users, [:project_id, :user_id], unique: true
  end
end
