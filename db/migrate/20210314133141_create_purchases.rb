class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases, id: :uuid do |t|
      t.timestamps
    end
  end
end
