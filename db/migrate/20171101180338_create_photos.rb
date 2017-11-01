class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content_type

      t.timestamps
    end
  end
end
