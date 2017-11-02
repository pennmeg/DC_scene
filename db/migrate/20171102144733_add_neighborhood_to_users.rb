class AddNeighborhoodToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :neighborhood, foreign_key: true
  end
end
