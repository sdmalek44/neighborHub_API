class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.references :district, foreign_key: true
      t.string :email
      t.string :photo, default: 'https://screenshotlayer.com/images/assets/placeholder.png'
      t.string :password_digest

      t.timestamps
    end
  end
end
