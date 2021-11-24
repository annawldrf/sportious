class AddUserToCourts < ActiveRecord::Migration[6.0]
  def change
    add_reference :courts, :user, null: false, foreign_key: true
  end
end
