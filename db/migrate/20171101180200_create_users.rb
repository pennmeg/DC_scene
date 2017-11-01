class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :primary_lang
      t.references :secondary_lang
      t.references :sender
      t.references :receiver
      t.string :fullname
      t.string :username
      t.string :password
      t.integer :age
      t.string :gender
      t.string :country
      t.string :us_state
      t.text :bio
      t.boolean :admin

      t.timestamps
    end
  end
end
