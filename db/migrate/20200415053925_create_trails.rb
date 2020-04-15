class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.integer :mtb_project_id
      t.string :name
      t.string :difficulty
      t.string :location
      t.string :url
      t.string :length
      t.string :ascent
      t.string :longitude
      t.string :latitude
      t.string :condition_status
      t.string :condition_details
      t.string :condition_date

      t.timestamps
    end
  end
end
