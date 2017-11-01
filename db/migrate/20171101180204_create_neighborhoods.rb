class CreateNeighborhoods < ActiveRecord::Migration[5.1]
  def change
    create_table :neighborhoods do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
