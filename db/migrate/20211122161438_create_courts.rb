class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.string :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :court_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
