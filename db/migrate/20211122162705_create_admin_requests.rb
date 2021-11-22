class CreateAdminRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_requests do |t|
      t.string :message
      t.string :action
      t.references :court, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
