class CreateHobbies < ActiveRecord::Migration[5.1]
  def change
    create_table :hobbies do |t|
      t.references :user, foreign_key: true
      t.string :reading
      t.string :gym
      t.string :movie
      t.string :dancing
      t.string :outside
      t.string :food
      t.string :drinks
      t.string :museums

      t.timestamps
    end
  end
end
