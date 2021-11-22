class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :title
      t.integer :capacity
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :court, null: false, foreign_key: true

      t.timestamps
    end
  end
end
