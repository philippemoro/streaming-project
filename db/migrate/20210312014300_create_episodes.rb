class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes, id: :uuid do |t|
      t.string :title
      t.string :plot
      t.integer :number

      t.references :season, type: :uuid, index: true, foreign_key: true
      t.timestamps
    end
  end
end
