# frozen_string_literal: true

class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents, id: :uuid do |t|
      t.string :title
      t.string :plot
      t.references :purchasable, type: :uuid, index: true, polymorphic: true

      t.timestamps
    end
  end
end
