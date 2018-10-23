class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :neighborhood_id
      t.integer :project_id
      t.string :email
      t.string :photo

      t.timestamps
    end
  end
end
