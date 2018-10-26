class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :photo, default: 'https://screenshotlayer.com/images/assets/placeholder.png'

      t.timestamps
    end
  end
end
