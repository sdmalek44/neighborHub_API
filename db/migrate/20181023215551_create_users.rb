class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :neighborhood_id
      t.references :project_id, foreign_key: true
      t.string :email
      t.string :photo

      t.timestamps
    end
  end
end
