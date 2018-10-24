class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.references :district, foreign_key: true
      t.string :email
      t.string :photo

      t.timestamps
    end
  end
end
