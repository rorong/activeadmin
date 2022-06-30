class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :name
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
