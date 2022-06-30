class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :labels_limits
      t.integer :carriers_limit
      t.datetime :started_at
      t.datetime :expired_at
      t.string :status
      t.integer :feature_ids, array: true, default: []

      t.timestamps
    end
  end
end
