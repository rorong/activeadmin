class AddProductToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_reference :features, :product, null: false, foreign_key: true
  end
end
